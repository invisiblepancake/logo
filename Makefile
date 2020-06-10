LOGO_BUILT=mergify-logo.png mergify-logo-title-horizontal.png mergify-logo-title-horizontal-white.svg mergify-logo-title-horizontal-white.png

logo.zip: mergify-logo.svg mergify-logo-title-horizontal.svg $(LOGO_BUILT)
	zip -r $@ $^

mergify-logo-title-horizontal-white.svg:
	sed 's/fill="#000000"/fill="#ffffff"/' mergify-logo-title-horizontal.svg > mergify-logo-title-horizontal-white.svg

# npm install svgexport -g
%.png: %.svg
	svgexport $< $@

clean:
	rm -f $(LOGO_BUILT) logo.zip
