DOCNAME=encares

.PHONY: all pdf view clean

all: pdf

pdf:
	./armarpdf.sh

view: pdf
	open adoc/$(DOCNAME).pdf

clean:
	rm -f adoc/$(DOCNAME).pdf
