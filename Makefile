SHELL := /bin/bash

# STYLES
# https://benjam.info/panam/
# https://jez.io/tufte-pandoc-css/

.DEFAULT_GOAL := build

.PHONY: build build-html spell-check spell-edit

build: spell-check build-html

build-html:
	@pandoc \
		--from markdown+smart \
		--to html5 \
		--standalone \
		--toc \
		--toc-depth=1 \
		--strip-comments \
		--email-obfuscation=references \
		--section-divs \
		--mathml \
		--highlight-style tango \
		--metadata pagetitle="Nick Mazurkin - personal page" \
		--metadata title="Nick Mazurkin" \
		--variable lang=en \
		--include-in-header html/gtag.html \
		--include-in-header html/favicon.html \
		--css css/styling.css \
		--css css/custom.css \
		--output index.html \
		README.md

spell-check:
	@aspell list --mode=markdown --lang=en --personal=$$(pwd)/misc/aspell.list < README.md

spell-edit:
	@aspell check --mode=markdown --lang=en --personal=$$(pwd)/misc/aspell.list --dont-backup README.md
