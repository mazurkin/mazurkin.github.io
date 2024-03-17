SHELL := /bin/bash

.PHONY: build build-html spell-check spell-edit

build: spell-check build-html

build-html:
	@pandoc \
		--from markdown \
		--to html \
		--standalone \
		--self-contained \
		--metadata title="Nick Mazurkin - personal page" \
		--css css/pandoc.css \
		--output index.html \
		README.md

spell-check:
	@aspell list --mode=markdown --lang=en --personal=$$(pwd)/misc/aspell.list < README.md

spell-edit:
	@aspell check --mode=markdown --lang=en --personal=$$(pwd)/misc/aspell.list --dont-backup README.md
