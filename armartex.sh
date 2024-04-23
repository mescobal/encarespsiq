asciidoctor -b docbook5 encares.adoc
mv encares.xml encares.docbook
pandoc -f docbook encares.docbook --pdf-engine=xelatex -o encares2.pdf

