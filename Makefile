SHELL := /bin/bash

# STYLES
# https://benjam.info/panam/
# https://jez.io/tufte-pandoc-css/

.PHONY: build build-html spell-check spell-edit

build: spell-check build-html

build-html:
	@pandoc \
		--from markdown+smart \
		--to html5 \
		--standalone \
		--toc \
		--metadata pagetitle="Nikolai Mazurkin - personal page" \
		--metadata title="Nikolai Mazurkin" \
		--variable lang=en \
		--variable highlighting-css= \
		--include-in-header misc/gtag.html \
		--include-in-header misc/favicon.html \
		--css css/styling.css \
		--mathjax \
		--output index.html \
		README.md

spell-check:
	@aspell list --mode=markdown --lang=en --personal=$$(pwd)/misc/aspell.list < README.md

spell-edit:
	@aspell check --mode=markdown --lang=en --personal=$$(pwd)/misc/aspell.list --dont-backup README.md
