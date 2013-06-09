#slideshow -t s5blank -o output derek
EXTENSION := .md
CONFIG := .slideshow 
THEME := goozbach
OUTPUTDIR := output
SLIDESHOW := https://github.com/goozbach-presentation/slideshow-goozbach.git

NAMES := $(patsubst %.md,%,$(wildcard *.md))

$(CONFIG):
	git submodule add $(SLIDESHOW) $(CONFIG)

$(OUTPUTDIR)/%.html: $(CONFIG)
	slideshow -c $(CONFIG) -t $(THEME) -o $(OUTPUTDIR) $(shell echo $@ | sed -e 's/output\/\(.*\)\.html/\1/')

.SECONDEXPANSION:
$(NAMES): $$(patsubst %,output/%.html,$$@)

.PHONY: all $(NAMES)
all: $(NAMES)
