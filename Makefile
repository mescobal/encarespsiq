DOCNAME=encares

all: encares

.PHONY: clean

report:
	pdflatex $(DOCNAME).tex
	bibtex $(DOCNAME).aux
	pdflatex $(DOCNAME).tex
	pdflatex $(DOCNAME).tex

view: report
	open $(DOCNAME).pdf

clean:
	latexmk -c
