#!/usr/bin/env python3
"""Convert per-chapter AsciiDoc source files (adoc/) into this project's Typst
chapter format (typst/).

This is a SYNTAX-level converter, not a semantic one. It mechanically
translates AsciiDoc markup constructs this book actually uses into their
Typst equivalent. It does NOT attempt to match the hand-editorial changes
already present in typst/ (e.g. reflowed prose, admonition type changes,
prose turned into bullet lists) -- adoc/ and typst/ chapters have diverged
over time (see CLAUDE.md), and this tool only bootstraps a new Typst file
from an AsciiDoc source; the output should be reviewed like any other diff.

Usage:
    ./adoc2typst.py adoc/F30.adoc                 # convert one file, write .typ next to it
    ./adoc2typst.py adoc/F30.adoc -o out.typ       # convert one file, choose the output path
    ./adoc2typst.py adoc/F30.adoc --stdout         # convert one file, print to stdout
    ./adoc2typst.py --batch                        # convert every cleanly-mapped chapter
    ./adoc2typst.py --batch --dry-run              # list what would be read/written, write nothing

Conversions performed:
    * Headings (`=`, `==`, ...)         -> left untouched (same depth convention in both formats)
    * Bold `*x*` / italic `_x_`         -> left untouched (same syntax in both formats)
    * `include::File.adoc[]`           -> `#include "File.typ"` (via FILENAME_MAP)
    * `* `, `** `, `*** ` bullets       -> `- `, `  - `, `    - ` (indented dash lists)
    * `. `, `.. `, `... ` numbered      -> `+ `, `  + `, `    + ` (indented Typst enums)
    * `footnote:[...]`                 -> `#footnote[...]`
    * `NOTE:`/`TIP:`/`WARNING:` leads   -> `#note[...]`/`#tip[...]`/`#warning[...]`
      (gathers the paragraph up to the next blank line into the brackets)
    * `.Block title` (adoc block title) -> heading one level deeper than the
      most recent heading seen (matches the pattern observed where typst/
      promoted these to real subsection headings, e.g. `.Alzheimer` under a
      level-4 heading became `===== Alzheimer`). Spot-check these: some
      block titles are captions for a following list/table, not real
      subsections, and may read oddly as a heading.
    * `image::file[caption]`           -> `#figure([#image("file")], caption: [...])`
    * literal `#`, `$`, stray `` ` ``   -> escaped (`\#`, `\$`, `` \` ``) so they
      aren't parsed as Typst code/math/raw-text markers
    * ``double-backtick quotes''       -> "curly quotes" (classic AsciiDoc smart-quote substitution)

NOT converted (left as-is, flagged when found):
    * AsciiDoc pipe tables (`|===`)     -- rare (3 chapters); convert by hand into
      Typst `#table(...)` since column/row semantics don't map mechanically.
    * `latexmath:[...]`                -- not used in any mapped chapter currently.
"""

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent
ADOC_DIR = REPO_ROOT / "adoc"
TYPST_DIR = REPO_ROOT / "typst"

# Chapters where adoc/<name>.adoc maps cleanly onto typst/<name>.typ (same
# content split, just a different file extension/markup). Established by
# diffing adoc/encares.adoc's include list against typst/encares.typ's.
FILENAME_MAP = {
    "Intro": "Intro",
    "Semiología": "Semiologia",
    "F00": "F00",
    "F05": "F05",
    "F10": "F10",
    "F10-26": "F10-26",
    "F11": "F11",
    "F20": "F20",
    "F22a": "F22a",
    "F22b": "F22b",
    "F23": "F23",
    "F30": "F30",
    "F31": "F31",
    "F31a": "F31a",
    "F32": "F32",
    "F40": "F40",
    "F40a": "F40a",
    "F41a": "F41a",
    "F41b": "F41b",
    "F42": "F42",
    "F43": "F43",
    "F44": "F44",
    "F45": "F45",
    "F48": "F48",
    "F50": "F50",
    "F51": "F51",
    "F60": "F60",
    "F60-3": "F60-3",
    "F63": "F63",
    "F68": "F68",
    "F70": "F70",
    "F84": "F84",
    "F90": "F90",
    "F98": "F98",
    "IAE": "IAE",
    "R53": "R53",
    "Estupor": "Estupor",
    "snm": "snm",
    "Fragmentos": "Fragmentos",
    "Abreviaturas": "Abreviaturas",
    "Autoagresiones": "Autoagresiones",
}

# Chapters whose adoc/ and typst/ split previously diverged in structure
# (different file splits/renames) and have since been reconciled to match
# adoc's split 1:1 -- kept here as a historical note, not consulted anymore.
# F22a/F22b: typst previously had a stale F22/F22a split, now matches adoc's F22a/F22b.
# F41a/F41b: typst previously had a 3-way F401/F410/F411 split, now matches adoc's 2-way split.
# F63: typst file renamed from F632.typ to F63.typ to match adoc.
# F98: typst file renamed from F985.typ to F98.typ to match adoc.
# R53: previously flagged as commented out of adoc's include list; it isn't (was already live).
SKIPPED_CHAPTERS: dict[str, str] = {
    "F93": "stale stub superseded by the fuller chronic-fatigue-syndrome content already merged into R53.adoc",
}

ADMONITION_MARKERS = {"NOTE": "note", "TIP": "tip", "WARNING": "warning"}

HEADING_RE = re.compile(r"^(=+)\s+\S")
BLOCK_TITLE_RE = re.compile(r"^\.([^\s.].*)$")
UNORDERED_LIST_RE = re.compile(r"^(\*+)\s+(.*)$")
ORDERED_LIST_RE = re.compile(r"^(\.+)\s+(.*)$")
ADMONITION_RE = re.compile(r"^(NOTE|TIP|WARNING):\s*(.*)$")
INCLUDE_RE = re.compile(r"^include::(?P<name>[^\[]+)\.adoc\[\]\s*$")
IMAGE_RE = re.compile(r"^image::(?P<path>\S+?)\[(?P<attrs>[^\]]*)\]\s*$")
FOOTNOTE_STRAY_HASH_RE = re.compile(r"#footnote:\[")
# Finds `footnote:[...]` and already-built `#note[...]`/`#tip[...]`/
# `#warning[...]` spans in the *fully assembled* text (run once at the end,
# not per line) so a footnote whose citation text wraps across several
# physical lines still gets its real closing `]` matched correctly.
PROTECTED_SPAN_RE = re.compile(
    r"footnote:\[(?P<foot>.*?)\]"
    r"|#(?P<adm_kind>note|tip|warning)\[(?P<adm_body>.*?)\]"
    # `convert_image`'s own output -- already correct Typst, pass through as-is.
    r"|(?P<fig>#figure\(\[#image\(\"[^\"]*\"\)\](?:, caption: \[[^\]]*\])?\))"
    r"|(?P<open>\[)"
    r"|(?P<close>\])",
    re.DOTALL,
)


def resolve_include(name: str) -> str:
    """Map an adoc include target to its typst filename, or flag it."""
    if name in FILENAME_MAP:
        return f'#include "{FILENAME_MAP[name]}.typ"'
    if name in SKIPPED_CHAPTERS:
        return f"// TODO(adoc2typst): {name} not converted -- {SKIPPED_CHAPTERS[name]}"
    return f"// TODO(adoc2typst): no typst mapping known for {name}.adoc, add it to FILENAME_MAP"


def convert_prose(text: str) -> str:
    """Normalize a stray "#footnote:[" typo, then escape Typst-significant
    characters. Safe to run per physical line (unlike footnote/bracket
    handling, which needs the fully assembled text -- see
    `convert_footnotes_and_brackets`).
    """
    text = FOOTNOTE_STRAY_HASH_RE.sub("footnote:[", text)
    return escape_special_chars(text)


def convert_footnotes_and_brackets(text: str) -> str:
    """Convert `footnote:[...]` to `#footnote[...]` and escape every other
    literal `[`/`]` in the fully assembled text.

    Must run once over the whole document (not per line): a footnote's
    citation text routinely wraps across several physical lines, so its
    opening and closing delimiters can be on different lines.
    """

    def escape_inner(s: str) -> str:
        # The non-greedy match stops at the first `]`, so any `[`/`]` that
        # was genuinely inside the captured text (rare) must still be
        # escaped, or it would open/close an unmatched nested block.
        return s.replace("[", r"\[").replace("]", r"\]")

    def repl(m: "re.Match[str]") -> str:
        if m.group("foot") is not None:
            return f"#footnote[{escape_inner(m.group('foot'))}]"
        if m.group("adm_kind") is not None:
            return f"#{m.group('adm_kind')}[{escape_inner(m.group('adm_body'))}]"
        if m.group("fig") is not None:
            return m.group("fig")
        return r"\[" if m.group("open") else r"\]"

    return PROTECTED_SPAN_RE.sub(repl, text)


def convert_image(match: "re.Match[str]") -> str:
    path, attrs = match.group("path"), match.group("attrs")
    # First comma-separated attr is a caption/alt if it isn't a key="value" pair.
    parts = [p.strip() for p in attrs.split(",")] if attrs else []
    caption = None
    if parts and "=" not in parts[0]:
        caption = parts[0]
    figure = f'#figure([#image("{path}")]'
    if caption:
        figure += f", caption: [{caption}]"
    figure += ")"
    return figure


def escape_special_chars(text: str) -> str:
    """Escape literal Typst-significant characters found in running prose."""
    # Classic AsciiDoc double-backtick smart quotes: ``text'' -> "curly quotes"
    text = re.sub(r"``([^`]*?)''", r"“\1”", text)
    # Any backtick left after that isn't paired -> escape so it doesn't start raw/code.
    text = text.replace("`", r"\`")
    text = text.replace("#", r"\#")
    text = text.replace("$", r"\$")
    # `<` starts Typst label syntax (`<name>`); the source only ever uses it
    # as a "less than" comparison, so escape it to render literally.
    text = text.replace("<", r"\<")
    # `//` starts a Typst line comment (used by URLs like `https://...`);
    # escaping just the first slash keeps both rendering as literal `/`.
    text = text.replace("//", r"\//")
    return text


def convert_lines(lines: list[str]) -> list[str]:
    out: list[str] = []
    heading_depth = 0
    i = 0
    n = len(lines)
    tables_seen = False

    while i < n:
        raw = lines[i]
        line = raw.rstrip("\n")

        # AsciiDoc document attribute entries (`:attr: value`) never belong in Typst content.
        if re.match(r"^:[\w-]+:.*$", line):
            i += 1
            continue

        heading_match = HEADING_RE.match(line)
        if heading_match:
            heading_depth = len(heading_match.group(1))
            out.append(convert_prose(line))
            i += 1
            continue

        include_match = INCLUDE_RE.match(line.strip())
        if include_match:
            out.append(resolve_include(include_match.group("name")))
            i += 1
            continue

        if line.strip() == "|===":
            tables_seen = True
            out.append("// TODO(adoc2typst): manual table conversion needed (adoc pipe table below)")
            out.append(escape_special_chars(line))
            i += 1
            continue

        image_match = IMAGE_RE.match(line.strip())
        if image_match:
            out.append(convert_image(image_match))
            i += 1
            continue

        block_title_match = BLOCK_TITLE_RE.match(line)
        if block_title_match:
            depth = min(heading_depth + 1, 6) or 1
            out.append("=" * depth + " " + convert_prose(block_title_match.group(1)))
            i += 1
            continue

        unordered_match = UNORDERED_LIST_RE.match(line)
        if unordered_match:
            stars, rest = unordered_match.groups()
            indent = "  " * (len(stars) - 1)
            out.append(f"{indent}- {convert_prose(rest)}")
            i += 1
            continue

        ordered_match = ORDERED_LIST_RE.match(line)
        if ordered_match:
            dots, rest = ordered_match.groups()
            indent = "  " * (len(dots) - 1)
            out.append(f"{indent}+ {convert_prose(rest)}")
            i += 1
            continue

        admonition_match = ADMONITION_RE.match(line)
        if admonition_match:
            kind, first = admonition_match.groups()
            body_lines = [first] if first else []
            i += 1
            while i < n and lines[i].strip() != "":
                body_lines.append(lines[i].rstrip("\n"))
                i += 1
            body = convert_prose("\n".join(body_lines))
            out.append(f"#{ADMONITION_MARKERS[kind]}[{body}]")
            continue

        out.append(convert_prose(line))
        i += 1

    if tables_seen:
        print(
            "warning: this file contains AsciiDoc pipe table(s) -- "
            "converted output has TODO markers, convert manually",
            file=sys.stderr,
        )

    return out


def fix_stray_asterisks(lines: list[str]) -> list[str]:
    """Escape literal `*` characters that AsciiDoc rendered as plain text but
    Typst would parse as unpaired strong-emphasis delimiters.

    This book's source has paragraphs where a `* ` list marker only at the
    true start of a line is a real AsciiDoc list item; every other `* `
    later in the same wrapped paragraph is literal text (AsciiDoc only
    recognizes markers at line-start), so it already renders as a bare
    asterisk character in the current PDF. Typst has no such rule -- `*` is
    always a markup delimiter -- so an odd number of them in a paragraph
    breaks compilation. Escaping the whole paragraph when its total count is
    odd matches current AsciiDoc rendering (plain asterisk characters).
    """
    out = lines[:]
    list_marker_re = re.compile(r"^\s*[-+]\s")
    blocks: list[list[int]] = []
    current: list[int] = []
    for i, line in enumerate(out):
        if line.strip() == "":
            if current:
                blocks.append(current)
                current = []
            continue
        # A heading or list marker starts a new block even without a blank
        # line before it -- otherwise adjacent list items (each their own
        # AsciiDoc paragraph) get lumped together, letting unrelated stray
        # asterisks in different items cancel each other out by coincidence.
        if current and (line.startswith("=") or list_marker_re.match(line)):
            blocks.append(current)
            current = []
        current.append(i)
    if current:
        blocks.append(current)

    star_re = re.compile(r"(?<!\\)\*")
    for block in blocks:
        eligible = [i for i in block if not out[i].startswith(("#", "//"))]
        if not eligible:
            continue
        total = sum(len(star_re.findall(out[i])) for i in eligible)
        if total % 2 == 1:
            for i in eligible:
                out[i] = star_re.sub(r"\\*", out[i])
    return out


def fix_line_start_slash(lines: list[str]) -> list[str]:
    """Escape a `/` at the very start of a line.

    Typst parses a line beginning with `/ ` as a term-list item (`/ term:
    description`) regardless of whether that line is a "new paragraph" in
    the source -- markup block markers are recognized per physical line.
    This book's source hard-wraps prose at a fixed column, so a `/` used as
    a plain separator (e.g. "compliance\n/ manejo de...") routinely lands at
    the start of a wrapped line by accident. Escape it so it stays literal.
    """
    out = []
    for line in lines:
        stripped = line.lstrip()
        if stripped.startswith("/") and not stripped.startswith(("//", r"\/")):
            indent = line[: len(line) - len(stripped)]
            out.append(indent + "\\" + stripped)
        else:
            out.append(line)
    return out


NOTE_ME_IMPORT = '#import "@preview/note-me:0.5.0": *'


def convert_text(text: str) -> str:
    lines = text.splitlines(keepends=True)
    converted = fix_line_start_slash(fix_stray_asterisks(convert_lines(lines)))
    result = convert_footnotes_and_brackets("\n".join(converted) + "\n")
    # Typst's `#include` does not share the includer's `#import` scope --
    # each chapter file needs its own import for `#note`/`#tip`/`#warning`
    # if it uses any (the master file's own import only covers itself).
    if any(f"#{kind}[" in result for kind in ADMONITION_MARKERS.values()):
        result = NOTE_ME_IMPORT + "\n" + result
    return result


def convert_file(src: Path, dst: Path | None, to_stdout: bool, dry_run: bool) -> None:
    text = src.read_text(encoding="utf-8")
    converted = convert_text(text)
    if to_stdout:
        sys.stdout.write(converted)
        return
    target = dst or src.with_suffix(".typ")
    if dry_run:
        print(f"would write {target} ({len(converted)} bytes)")
        return
    target.write_text(converted, encoding="utf-8")
    print(f"wrote {target}")


def run_batch(dry_run: bool) -> None:
    for adoc_name, typst_name in FILENAME_MAP.items():
        src = ADOC_DIR / f"{adoc_name}.adoc"
        dst = TYPST_DIR / f"{typst_name}.typ"
        if not src.exists():
            print(f"skip: {src} not found", file=sys.stderr)
            continue
        convert_file(src, dst, to_stdout=False, dry_run=dry_run)

    if SKIPPED_CHAPTERS:
        print("\nSkipped (need manual reconciliation, not auto-converted):", file=sys.stderr)
        for name, reason in SKIPPED_CHAPTERS.items():
            print(f"  - {name}.adoc: {reason}", file=sys.stderr)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("source", nargs="?", type=Path, help="a single .adoc file to convert")
    parser.add_argument("-o", "--output", type=Path, help="output .typ path (single-file mode only)")
    parser.add_argument("--stdout", action="store_true", help="print converted output instead of writing a file")
    parser.add_argument("--batch", action="store_true", help="convert every cleanly-mapped chapter, adoc/ -> typst/")
    parser.add_argument("--dry-run", action="store_true", help="report what would happen without writing files")
    args = parser.parse_args()

    if args.batch:
        run_batch(dry_run=args.dry_run)
        return

    if not args.source:
        parser.error("provide a source .adoc file, or use --batch")

    convert_file(args.source, args.output, to_stdout=args.stdout, dry_run=args.dry_run)


if __name__ == "__main__":
    main()
