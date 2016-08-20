TEX_FILES = $(wildcard *.tex)
TARGETS = $(TEX_FILES:%.tex=%.pdf)

JUNK_DIR = latex_files

all: $(TARGETS)

# xxx.tex -> xxx.pdf
%.pdf: %.tex
	@mkdir -p $(JUNK_DIR)
	@xelatex --output-directory=$(JUNK_DIR) $<
	@echo first pass done
	@xelatex --output-directory=$(JUNK_DIR) $<
	@echo second pass done
	mv $(JUNK_DIR)/$@ $@

.PHONY: clean
clean:
	rm -rf $(JUNK_DIR)
	rm -f $(TARGETS)
