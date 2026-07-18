asciidoctor -b docbook5 adoc/encares.adoc
mv adoc/encares.xml adoc/encares.docbook
pandoc -f docbook adoc/encares.docbook --pdf-engine=xelatex -o adoc/encares2.pdf

