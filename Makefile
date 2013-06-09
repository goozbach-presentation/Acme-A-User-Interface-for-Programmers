#slideshow -t s5blank -o output derek
EXTENSION := .md
CONFIG := .slideshow 
THEME := goozbach
OUTPUTDIR := output

NAMES := $(patsubst %.md,%,$(wildcard *.md))

$(OUTPUTDIR)/%.html: $(CONFIG)
	slideshow -c $(CONFIG) -t $(THEME) -o $(OUTPUTDIR) $(shell echo $@ | sed -e 's/output\/\(.*\)\.html/\1/')

.SECONDEXPANSION:
$(NAMES): $$(patsubst %,output/%.html,$$@)

.PHONY: all $(NAMES)
all: $(NAMES)
