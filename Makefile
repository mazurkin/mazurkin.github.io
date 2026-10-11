# Nick Mazurkin - personal page

SHELL       = /bin/bash
TIMESTAMP   = $(shell date --utc '+%Y-%m-%d')
ROOT        = $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

ASPELL      = aspell --mode=markdown --lang=en --encoding=utf-8 --dont-backup --personal="$$(pwd)/misc/aspell.list"
CHROME      = chromium
QRENCODE    = qrencode --level=H --size=3 --dpi=72 --margin=0
PANDOC_DATA = $(ROOT)/misc/pandoc/data

WEBSERVER_BIND = 127.0.0.1
WEBSERVER_PORT = 9001
WEBSERVER_TAG  = personalweb
WEBSERVER      = python3 -m http.server --bind $(WEBSERVER_BIND) $(WEBSERVER_PORT)

SITE_DOMAIN   = mazurk.in
SITE_TITLE    = Nick Mazurkin
SITE_SUBTITLE = [ the personal page ]

GPG_USER      = n@mazurk.in

export ASSISTANT_API_MODEL = google/gemini-3.8-flash
export ASSISTANT_API_KEY   = ${OPENROUTER_API_KEY}

# -----------------------------------------------------------------------------
#
# utils
#
# -----------------------------------------------------------------------------

.PHONY: setup
setup:
	@sudo apt-get install pandoc aspell wkhtmltopdf qrencode daemon

.PHONY: gpg
gpg:
	@gpg --armor --export "$(GPG_USER)" > file/pgp/public.txt

.PHONY: qr
qr:
	@$(QRENCODE) --type=PNG --output=i/qr/root.png   'https://mazurk.in/'
	@$(QRENCODE) --type=SVG --output=i/qr/root.svg   'https://mazurk.in/'
	@$(QRENCODE) --type=PNG --output=i/qr/resume.png 'https://mazurk.in/#resume'
	@$(QRENCODE) --type=SVG --output=i/qr/resume.svg 'https://mazurk.in/#resume'

.PHONY: audit
audit:
	@$(CHROME) \
		--headless \
	 	--disable-gpu --hide-scrollbars --mute-audio \
		--window-size=1024,1024 \
		--force-device-scale-factor=0.5 \
		--timeout=60000 \
		--enable-logging=stderr \
		--v=1 \
		'https://$(SITE_DOMAIN)/' \
	2>"$(ROOT)/target/audit.log"

# -----------------------------------------------------------------------------
#
# server
#
# -----------------------------------------------------------------------------

.PHONY: server-start
server-start:
	@echo "starting http://$(WEBSERVER_BIND):$(WEBSERVER_PORT)/"
	@daemon --name $(WEBSERVER_TAG) --chdir=$(ROOT) -- $(WEBSERVER)

.PHONY: server-stop
server-stop:
	@echo "stopping http://$(WEBSERVER_BIND):$(WEBSERVER_PORT)/"
	@daemon --name $(WEBSERVER_TAG) --stop

.PHONY: server-run
server-run:
	@echo "running http://$(WEBSERVER_BIND):$(WEBSERVER_PORT)/"
	@daemon --name $(WEBSERVER_TAG) --chdir=$(ROOT) --foreground -- $(WEBSERVER)

# -----------------------------------------------------------------------------
#
# spell-checker
#
# -----------------------------------------------------------------------------

all_md_files          = $(wildcard *.md doc/**/*.md page/**/*.md)
all_spell_check_files = $(all_md_files:%.md=%.spellcheck)
all_spell_edit_files  = $(all_md_files:%.md=%.spelled)

.PHONY: spell-check
spell-check: $(all_spell_check_files)

.PHONY: spell-edit
spell-edit: $(all_spell_edit_files)

$(all_spell_check_files): %.spellcheck: %.md
	@cat $< | $(ASPELL) list | grep --with-filename --line-number --fixed-strings --file=- $<; [ $$? -eq 1 ]
	@sha256sum $< > $@

$(all_spell_edit_files): %.spelled: %.md
	@$(ASPELL) check $<

# -----------------------------------------------------------------------------
#
# preview
#
# -----------------------------------------------------------------------------

.PHONY: build-preview
build-preview: README.png

README.png: $(wildcard README.html README.css README.header.html README.footer.html css/style.css i/**/* i/*)
	@daemon --name $(WEBSERVER_TAG) --chdir=$(ROOT) -- $(WEBSERVER)
	@$(CHROME) \
		--headless \
	 	--disable-gpu --hide-scrollbars --mute-audio \
		--window-size=1024,1024 \
		--force-device-scale-factor=0.5 \
		--timeout=60000 \
		--enable-logging=stderr \
		--v=0 \
		--screenshot=README.png \
		'http://$(WEBSERVER_BIND):$(WEBSERVER_PORT)/'
	@daemon --name $(WEBSERVER_TAG) --stop

# -----------------------------------------------------------------------------
#
# favicon
#
# -----------------------------------------------------------------------------

.PHONY: build-favicon
build-favicon: i/favicon.ico

i/favicon.ico: i/favicon.png
	@convert $< \
		-background transparent \
		-colors 256 \
		\( -clone 0 -resize 16x16 \) \
		\( -clone 0 -resize 24x24 \) \
      	\( -clone 0 -resize 32x32 \) \
      	\( -clone 0 -resize 48x48 \) \
      	\( -clone 0 -resize 64x64 \) \
      	\( -clone 0 -resize 128x128 \) \
      	\( -clone 0 -resize 256x256 \) \
      	$@

# -----------------------------------------------------------------------------
#
# pages
#
# -----------------------------------------------------------------------------

pages_md_files   = $(wildcard page/**/*.md README.md)
pages_html_files = $(pages_md_files:%.md=%.html)

.PHONY: build-pages
build-pages: $(pages_html_files)

$(pages_html_files): %.html: %.md %.header.html %.footer.html html/humans.html html/meta.html html/favicon.html html/gtag.html html/clarity.html html/jquery.html
	@pandoc \
		--data-dir "$(PANDOC_DATA)" \
		--from markdown+smart \
		--to html5 \
		--standalone \
		--strip-comments \
		--email-obfuscation=javascript \
		--section-divs \
		--mathml \
		--highlight-style=tango \
		--metadata title="$(SITE_TITLE)" \
		--metadata subtitle="$(SITE_SUBTITLE)" \
		--metadata date="$(TIMESTAMP)" \
		--variable lang="en" \
		--toc \
		--toc-depth=1 \
		--css "/css/style.css" \
		--css "/$(<:%.md=%.css)" \
		--include-in-header "html/humans.html" \
		--include-in-header "html/meta.html" \
		--include-in-header "html/favicon.html" \
		--include-in-header "html/gtag.html" \
		--include-in-header "html/clarity.html" \
		--include-in-header "html/jquery.html" \
		--include-in-header "$(<:%.md=%.header.html)" \
		--include-after-body "$(<:%.md=%.footer.html)" \
		--output $@ \
		$<

# -----------------------------------------------------------------------------
#
# documents
#
# -----------------------------------------------------------------------------

docs_md_files   = $(wildcard doc/**/*.md)
docs_html_files = $(docs_md_files:%.md=%.html)
docs_pdf_files  = $(docs_md_files:%.md=%.pdf)
docs_docx_files = $(docs_md_files:%.md=%.docx)
docs_odt_files  = $(docs_md_files:%.md=%.odt)
docs_rtf_files  = $(docs_md_files:%.md=%.rtf)
docs_txt_files  = $(docs_md_files:%.md=%.txt)

.PHONY: build-docs
build-docs: $(docs_html_files) $(docs_pdf_files) $(docs_docx_files) $(docs_odt_files) $(docs_rtf_files) $(docs_txt_files)

$(docs_html_files): %.html: %.md html/humans.html html/meta.html html/favicon.html html/gtag.html html/clarity.html
	@pandoc \
		--data-dir "$(PANDOC_DATA)" \
		--from markdown+smart \
		--to html5 \
		--standalone \
		--strip-comments \
		--section-divs \
		--mathml \
		--highlight-style=tango \
		--metadata title="" \
		--metadata subtitle="" \
		--metadata date="$(TIMESTAMP)" \
		--variable lang="en" \
		--css "../../css/document.css" \
		--include-in-header "html/humans.html" \
		--include-in-header "html/meta.html" \
		--include-in-header "html/favicon.html" \
		--include-in-header "html/gtag.html" \
		--include-in-header "html/clarity.html" \
		--output $@ \
		$<

$(docs_rtf_files): %.rtf: %.md
	@pandoc \
		--data-dir "$(PANDOC_DATA)" \
		--from markdown+smart \
		--to rtf \
		--standalone \
		--strip-comments \
		--variable lang="en" \
		--output $@ \
		$<

$(docs_txt_files): %.txt: %.md
	@pandoc \
		--data-dir "$(PANDOC_DATA)" \
		--from markdown+smart \
		--to plain \
		--standalone \
		--strip-comments \
		--variable lang="en" \
		--output $@ \
		$<

$(docs_docx_files): %.docx: %.md $(ROOT)/misc/pandoc/reference/custom-reference.docx
	@pandoc \
		--data-dir "$(PANDOC_DATA)" \
		--reference-doc "$(ROOT)/misc/pandoc/reference/custom-reference.docx" \
		--from markdown+smart \
		--to docx \
		--standalone \
		--strip-comments \
		--variable lang="en" \
		--output $@ \
		$<

$(docs_odt_files): %.odt: %.md $(ROOT)/misc/pandoc/reference/custom-reference.odt
	@pandoc \
		--data-dir "$(PANDOC_DATA)" \
		--reference-doc "$(ROOT)/misc/pandoc/reference/custom-reference.odt" \
		--from markdown+smart \
		--to odt \
		--standalone \
		--strip-comments \
		--variable lang="en" \
		--output $@ \
		$<

$(docs_pdf_files): %.pdf: %.html css/document.css
	@wkhtmltopdf \
		--page-size Letter \
		--orientation Portrait \
		--title "$(SITE_TITLE)" \
		--enable-local-file-access \
		--grayscale \
		--images \
		--enable-javascript \
		--disable-plugins \
		--no-background \
		--margin-top    12 \
		--margin-bottom 12 \
		--margin-left   16 \
		--margin-right  16 \
		$< \
		$@

# -----------------------------------------------------------------------------
#
# assistant
#
# -----------------------------------------------------------------------------

.PHONY: assistant-avatar
assistant-avatar:
	@echo "*** AVATAR"
	@misc/helpers/assistant "i/avatar.jpg" "image/jpeg" \
		"Provided with the photo tell how the person on the photo look like?"

.PHONY: assistant-evaluate
assistant-evaluate:
	@echo "*** EVALUATION"
	@misc/helpers/assistant "doc/resume/resume.pdf" "application/pdf" \
		"Provided with the resume make summary of all strong and weak characteristics of the candidate?"

.PHONY: assistant-specialty
assistant-specialty:
	@echo "*** SPECIALTY"
	@misc/helpers/assistant "doc/resume/resume.pdf" "application/pdf" \
		"Provided with the resume explain the speciality of the candidate and how he could contribute to the company?"

.PHONY: assistant-contacts
assistant-contacts:
	@echo "*** CONTACTS"
	@misc/helpers/assistant "doc/resume/resume.pdf" "application/pdf" \
		"Provided with the resume check what type of contact information it has?"

.PHONY: assistant-location
assistant-location:
	@echo "*** LOCATION"
	@misc/helpers/assistant "doc/resume/resume.pdf" "application/pdf" \
		"Provided with the resume display where the candidate is located?"

.PHONY: assistant-residency
assistant-residency:
	@echo "*** RESIDENCY"
	@misc/helpers/assistant "doc/resume/resume.pdf" "application/pdf" \
		"Provided with the resume find out the migration status of the candidate in the United States?"

.PHONY: assistant-style
assistant-style:
	@echo "*** STYLE"
	@misc/helpers/assistant "doc/resume/resume.pdf" "application/pdf" \
		"Provided with the resume find and explain the stylistic errors? How the resume could be improved?"

.PHONY: assistant-summary
assistant-summary: export ASSISTANT_API_MODEL  = anthropic/claude-opus-5.5
assistant-summary: export ASSISTANT_API_EFFORT = high
assistant-summary:
	@echo "*** SUMMARY"
	@misc/helpers/assistant "doc/resume/resume.pdf" "application/pdf" \
		"Take the last work experience and summarize if for the LinkedIn profile. The "Highlights" field must be up to 2000 characters, use 1950 of them. Use formal tone and plain ASCII text. Optimize the description for searching and mention all the keywords. Description only, no titles and years." \
	| tee "$(ROOT)/llms.txt"

.PHONY: assistant
assistant: assistant-avatar assistant-contacts assistant-location assistant-residency assistant-specialty assistant-evaluate assistant-style assistant-summary

# -----------------------------------------------------------------------------
#
# default
#
# -----------------------------------------------------------------------------

.DEFAULT_GOAL := build

.PHONY: build
build: spell-check build-pages build-docs build-favicon build-preview
