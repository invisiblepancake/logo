LOGO_BUILT=mergify-black.png mergify-white.png mergify-brand-mark-black.png mergify-brand-mark-white.png

logo.zip: mergify-black.svg mergify-white.svg mergify-brand-mark-black.svg mergify-brand-mark-white.svg $(LOGO_BUILT)
	zip -r $@ $^

# npm install svgexport -g
%.png: %.svg
	svgexport $< $@ png 100% "" 1024:

clean:
	rm -f $(LOGO_BUILT) logo.zip
