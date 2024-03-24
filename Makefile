SHELL := /bin/bash

.DEFAULT_GOAL := build

.PHONY: build
build: spell-check build-html

.PHONY: build-html
build-html:
	@pandoc \
		--from markdown+smart \
		--to html5 \
		--standalone \
		--toc \
		--toc-depth=1 \
		--strip-comments \
		--email-obfuscation=javascript \
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

.PHONY: spell-check
spell-check:
	@aspell list --mode=markdown --lang=en --personal=$$(pwd)/misc/aspell.list < README.md

.PHONY: spell-edit
spell-edit:
	@aspell check --mode=markdown --lang=en --personal=$$(pwd)/misc/aspell.list --dont-backup README.md
