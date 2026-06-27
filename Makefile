.PHONY: preview render slides all clean

# Fast: preview book only (no slides)
preview:
	uv run quarto preview

# Book only (no slides)
render:
	uv run quarto render

# Slides only
slides:
	@mkdir -p docs/slides
	@for f in slides/week-*.qmd; do \
		echo "Rendering $$f..."; \
		uv run quarto render "$$f"; \
	done
	@cp slides/week-*.html docs/slides/
	@echo "Slides copied to docs/slides/"

# Full production build: book + slides
all: render slides

clean:
	uv run quarto clean
