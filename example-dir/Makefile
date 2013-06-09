#slideshow -t s5blank -o output derek
EXTENSION := .md
CONFIG := .slideshow 
THEME := goozbach
OUTPUTDIR := output
SLIDESHOW := https://github.com/goozbach-presentation/slideshow-goozbach.git

NAMES := $(patsubst %.md,%,$(wildcard *.md))

$(CONFIG):
	git submodule add $(SLIDESHOW) $(CONFIG)

$(OUTPUTDIR)/%.html: $(CONFIG) %.md *.png
	slideshow -c $(CONFIG) -t $(THEME) -o $(OUTPUTDIR) $(shell echo $@ | sed -e 's/$(OUTPUTDIR)\/\(.*\)\.html/\1/')
	cd $(OUTPUTDIR) && ln -sf $(shell echo $@ | sed -e 's/$(OUTPUTDIR)\/\(.*\.html\)/\1/') index.html && cd -
	cp *.png $(OUTPUTDIR)/
	cp *.jpg $(OUTPUTDIR)/

.SECONDEXPANSION:
$(NAMES): $$(patsubst %,output/%.html,$$@)

.PHONY: all $(NAMES) clean update

update:
	git submodule init
	git submodule update

clean:
	rm -rf $(OUTPUTDIR)

all: $(NAMES)
