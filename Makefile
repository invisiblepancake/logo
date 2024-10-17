SVG_FILES := $(wildcard *.svg)
PNG_FILES := $(SVG_FILES:.svg=.png)
ZIP_FILE := logo.zip
SVGEXPORT := svgexport

# Default target
all: $(ZIP_FILE)

# Rule to create the zip containing both SVG and PNG files
$(ZIP_FILE): $(SVG_FILES) $(PNG_FILES)
	@echo "Creating $@ with SVG and PNG files..."
	zip -r $@ $^

# Pattern rule to convert SVG to PNG
%.png: %.svg
	@echo "Converting $< to $@..."
	$(SVGEXPORT) "$<" "$@" png 100% "" 1024:

# Clean target to remove generated PNGs and the zip
.PHONY: clean
clean:
	@echo "Cleaning up generated files..."
	rm -f $(PNG_FILES) $(ZIP_FILE)
