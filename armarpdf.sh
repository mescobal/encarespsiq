#!/bin/sh
# Compile adoc/encares.adoc directly into adoc/encares.pdf using Asciidoctor PDF.
# This is how the currently published encares.pdf was produced (see its PDF
# metadata: "Asciidoctor PDF"), unlike armar.sh/armartex.sh which go through
# a DocBook + LaTeX/pandoc detour and produce encares2.pdf instead.
asciidoctor-pdf adoc/encares.adoc -o adoc/encares.pdf
