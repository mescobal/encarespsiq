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
    "F23": "F23",
    "F30": "F30",
    "F31": "F31",
    "F32": "F32",
    "F40": "F40",
    "F42": "F42",
    "F43": "F43",
    "F44": "F44",
    "F45": "F45",
    "F48": "F48",
    "F50": "F50",
    "F51": "F51",
    "F60": "F60",
    "F60-3": "F60-3",
    "F68": "F68",
    "F70": "F70",
    "F84": "F84",
    "F90": "F90",
    "IAE": "IAE",
    "Estupor": "Estupor",
    "snm": "snm",
    "Fragmentos": "Fragmentos",
    "Abreviaturas": "Abreviaturas",
}

# Chapters whose adoc/ and typst/ split genuinely differ in structure, not
# just naming -- converting these by filename guesswork risks silently
# discarding typst-only content. Batch mode skips these and reports why.
SKIPPED_CHAPTERS = {
    "F22a": "adoc has F22a+F22b; typst has F22+F22a -- different 2-way split, needs manual reconciliation",
    "F22b": "adoc has F22a+F22b; typst has F22+F22a -- different 2-way split, needs manual reconciliation",
    "F41a": "adoc has F41a+F41b; typst has F401+F410+F411 -- 2-way vs 3-way split, needs manual reconciliation",
    "F41b": "adoc has F41a+F41b; typst has F401+F410+F411 -- 2-way vs 3-way split, needs manual reconciliation",
    "F63": "adoc/F63.adoc vs typst/F632.typ -- renamed, content may have diverged, verify before mapping",
    "F98": "adoc/F98.adoc vs typst/F985.typ -- renamed, content may have diverged, verify before mapping",
    "R53": "commented out of adoc/encares.adoc's include list, but actively included in typst/encares.typ",
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
FOOTNOTE_RE = re.compile(r"footnote:\[")


def resolve_include(name: str) -> str:
    """Map an adoc include target to its typst filename, or flag it."""
    if name in FILENAME_MAP:
        return f'#include "{FILENAME_MAP[name]}.typ"'
    if name in SKIPPED_CHAPTERS:
        return f"// TODO(adoc2typst): {name} not converted -- {SKIPPED_CHAPTERS[name]}"
    return f"// TODO(adoc2typst): no typst mapping known for {name}.adoc, add it to FILENAME_MAP"


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
            out.append(escape_special_chars(line))
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
            out.append("=" * depth + " " + escape_special_chars(block_title_match.group(1)))
            i += 1
            continue

        unordered_match = UNORDERED_LIST_RE.match(line)
        if unordered_match:
            stars, rest = unordered_match.groups()
            indent = "  " * (len(stars) - 1)
            out.append(f"{indent}- {escape_special_chars(rest)}")
            i += 1
            continue

        ordered_match = ORDERED_LIST_RE.match(line)
        if ordered_match:
            dots, rest = ordered_match.groups()
            indent = "  " * (len(dots) - 1)
            out.append(f"{indent}+ {escape_special_chars(rest)}")
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
            body = escape_special_chars("\n".join(body_lines))
            out.append(f"#{ADMONITION_MARKERS[kind]}[{body}]")
            continue

        # Plain prose line: normalize stray "#footnote:[" typos, then convert footnotes.
        line = FOOTNOTE_STRAY_HASH_RE.sub("footnote:[", line)
        line = escape_special_chars(line)
        line = FOOTNOTE_RE.sub("#footnote[", line)
        out.append(line)
        i += 1

    if tables_seen:
        print(
            "warning: this file contains AsciiDoc pipe table(s) -- "
            "converted output has TODO markers, convert manually",
            file=sys.stderr,
        )

    return out


def convert_text(text: str) -> str:
    lines = text.splitlines(keepends=True)
    return "\n".join(convert_lines(lines)) + "\n"


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
