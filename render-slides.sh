#!/bin/bash
# Render all slide decks to docs/slides/
# Called automatically as a post-render script by quarto render

set -e
mkdir -p docs/slides

for f in slides/week-*.qmd; do
  echo "Rendering $f..."
  quarto render "$f"
done

cp slides/week-*.html docs/slides/
echo "Slides copied to docs/slides/"
