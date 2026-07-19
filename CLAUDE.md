# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repository is

This is **not a software project** — it's the source for "Encares de Psiquiatría", a Spanish-language psychiatric reference book/study guide for medical residency exams, authored by Marcelo Escobal. There is no application code, no tests, and no CI. All work here is document editing: writing/revising clinical psychiatry content and maintaining the toolchain that renders it to PDF.

## Repository structure

The book exists in **parallel formats** that are not auto-generated from one another, and whose content has diverged over time:

- `adoc/` — **primary, actively maintained** source, using [AsciiDoc](https://asciidoc.org/). `encares.adoc` is the master file that `include::`s one `.adoc` file per chapter. This is the format referenced in `README.md` as the one external contributors are asked to edit.
- `typst/` — **obsolete, no longer maintained**, using [Typst](https://typst.app/). `encares.typ` is the master file that `#include`s one `.typ` file per chapter/section; `formato.typ` holds shared styling. Kept around for reference/history only — do not treat it as a build target or propagate new content into it unless the user explicitly asks. See `adoc2typst.py` if a one-off AsciiDoc→Typst conversion is ever needed again.

Chapters/files are named after **ICD-10 codes** (e.g. `F30.*` = manic/bipolar episodes, `F40.*` = phobic anxiety disorders, `F44.*` = dissociative disorders), matching the clinical classification the book is organized around. The same code generally has a same-named file in each format directory, but content is NOT kept in sync 1:1 across formats — e.g. `adoc/F30.adoc` and `typst/F30.typ` differ substantially in wording and length, and several chapters don't even split into files the same way between the two (see `adoc2typst.py`'s `SKIPPED_CHAPTERS` for the specific mismatches).

Bibliography: `encares.bib` (BibDesk-managed BibTeX) at the repo root, duplicated per-format in `adoc/`, `typst/`.

## Build commands

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

## Conventions when editing content

- Content is in Spanish (`es`); keep terminology, abbreviations, and clinical style consistent with the surrounding text (e.g. abbreviations like `EDM`, `AF`, `TDAH` are used throughout — see `Abreviaturas.adoc`/`.typ` for the glossary chapter).
- Follow AsciiDoc's existing markup conventions in `adoc/` — section levels (`==`, `===`, ...), `include::` structure, admonitions (`NOTE:`/`TIP:`/`WARNING:`), `footnote:[...]`.
- Prefer citing sources with bibliography keys already present in `encares.bib` when adding clinical claims; add new BibTeX entries there (and the corresponding per-format copy) if introducing a new reference. `README.md` explicitly asks that added/modified content include the relevant bibliographic citations.
