md=$(shell ls *.md)
md_html=$(md:%.md=%.html)

all: $(md_html)

%.html: %.md
	pandoc --from markdown --to html --css styles.css --standalone -o $@ $<
