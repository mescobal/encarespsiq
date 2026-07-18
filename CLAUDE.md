# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repository is

This is **not a software project** — it's the source for "Encares de Psiquiatría", a Spanish-language psychiatric reference book/study guide for medical residency exams, authored by Marcelo Escobal. There is no application code, no tests, and no CI. All work here is document editing: writing/revising clinical psychiatry content and maintaining the toolchain that renders it to PDF.

## Repository structure

The book exists in **parallel, independently-maintained formats** — they are not auto-generated from one another, and their content has diverged over time:

- `typst/` — **primary, actively maintained** source, using [Typst](https://typst.app/). `encares.typ` is the master file that `#include`s one `.typ` file per chapter/section. `formato.typ` holds shared styling (heading sizes, numbering, paragraph settings). Uses Typst packages `min-book`, `fontawesome`, `note-me`.
- `adoc/` — **also actively maintained**, using [AsciiDoc](https://asciidoc.org/). `encares.adoc` is the master file that `include::`s one `.adoc` file per chapter. This is the format referenced in `README.md` as the one external contributors are asked to edit.
- `typst-bak/` — a periodic snapshot/backup of `typst/`, committed manually. Not the canonical source; check `typst/` first for current content and only cross-reference `typst-bak/` when diffing history.
- `tex/` — legacy LaTeX version, largely stale (last substantive update predates the typst/adoc content).
- `md/` — occasional Markdown exports, not actively maintained.

Chapters/files are named after **ICD-10 codes** (e.g. `F30.*` = manic/bipolar episodes, `F40.*` = phobic anxiety disorders, `F44.*` = dissociative disorders), matching the clinical classification the book is organized around. The same code generally has a same-named file in each format directory, but content is NOT kept in sync 1:1 across formats — e.g. `adoc/F30.adoc` and `typst/F30.typ` currently differ substantially in wording and length. When asked to update a chapter, clarify (or infer from context) whether the edit should go into `typst/`, `adoc/`, or both.

Bibliography: `encares.bib` (BibDesk-managed BibTeX) at the repo root, duplicated per-format in `adoc/`, `tex/`, `typst/`.

## Build commands

**Typst** (primary format):
```sh
typst compile typst/encares.typ typst/encares.pdf
```
Individual chapter files can also be compiled standalone where they produce their own `.pdf` (several chapter `.typ` files in `typst/` have a matching `.pdf`, e.g. `F30.typ` → `F30.pdf`).

**AsciiDoc → PDF** (via DocBook + LaTeX, see `armartex.sh`):
```sh
asciidoctor -b docbook5 adoc/encares.adoc
mv encares.xml encares.docbook
pandoc -f docbook encares.docbook --pdf-engine=xelatex -o encares2.pdf
```
Alternate path via `armar.sh` (asciidoc + dblatex):
```sh
asciidoc -b docbook adoc/encares2.adoc
dblatex encares2.xml
```

**LaTeX** (`tex/`, legacy):
```sh
make report   # pdflatex + bibtex + pdflatex x2, via Makefile (DOCNAME=encares)
make view     # report, then opens the PDF
make clean    # latexmk -c
```

## Conventions when editing content

- Content is in Spanish (`es`); keep terminology, abbreviations, and clinical style consistent with the surrounding text (e.g. abbreviations like `EDM`, `AF`, `TDAH` are used throughout — see `Abreviaturas.adoc`/`.typ` for the glossary chapter).
- Follow each format's existing markup conventions in the file being edited — AsciiDoc section levels (`==`, `===`, ...) in `adoc/`, matching Typst heading levels in `typst/`. Heading depth in Typst maps to numbering/pagebreak rules defined in `formato.typ`.
- Prefer citing sources with bibliography keys already present in `encares.bib` when adding clinical claims; add new BibTeX entries there (and the corresponding per-format copy) if introducing a new reference. `README.md` explicitly asks that added/modified content include the relevant bibliographic citations.
- Do not treat `typst-bak/` as a place to make substantive edits — it's a backup snapshot, not a live source.
