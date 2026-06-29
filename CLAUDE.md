# CLAUDE.md — BANA 7025 Development Guide

This file guides Claude Code when working in this repository.

## What this repo is

**BANA 7025: Data Wrangling with Python** — a 7-week graduate course at UC.

- **Authoring layer:** Quarto (`.qmd` files) for textbook and slides
- **Lab format:** Jupyter notebooks (`.ipynb`)
- **Python stack:** pandas, numpy, matplotlib, seaborn, scikit-learn
- **Project dataset:** `completejourney_py` Python package
- **Deployment:** GitHub Pages (static Quarto build) + optional Vercel for AI tutor

## Repository layout

```
book/          Quarto textbook chapters (01–13 + index + references)
slides/        Weekly Reveal.js decks (week-01.qmd, week-02.qmd, ...)
notebooks/     Jupyter notebooks (examples/, tuesday-your-turn/, project-checkpoints/)
labs/          Thursday lab assignments (.ipynb)
assignments/   Homework, midterm, final project
project/       Semester project overview and checkpoint templates
tutor/         AI tutor configuration (system prompt, source lists, indexing config)
instructor/    Instructor-only materials — NEVER index or expose to students
data/          Shared datasets
```

## Module → chapter mapping

| Module | Week | Chapters |
|--------|------|---------|
| 1 | 1 | 01-intro-data-mining, 02-preparing-for-code, 03-python-basics |
| 2 | 2 | 04-jupyter, 05-data-structures, 06-libraries |
| 3 | 3 | 07-importing-data, 08-dataframes, 09-subsetting |
| 4 | 4 | 10-manipulating-data, 11_aggregating_data, 12-joining-data |
| 5 | 5 | 13-data-viz-pandas, 14-data-viz-matplotlib, 15-data-viz-bokeh |
| 6 | 6 | 16-control-statements, 17-iteration-statements, 18-functions |
| 7 | 7 | 19-data-exploration, 20-first-model, 21-feature-engineering, 22-model-evaluation |

## Content conventions

### Textbook chapters (`.qmd`)

- Start with a short intro paragraph (2–4 sentences), no preamble heading
- Second element: `By the end of this chapter, you will:` bullet list
- Use `##` for major sections, `###` for subsections
- Use Quarto callouts: `{.callout-note}`, `{.callout-tip}`, `{.callout-warning}`
- Include a `## Project Checkpoint` section in applicable chapters
- Python code blocks: ` ```python ` for non-executable, ` ```{python} ` for executable
- Use `#| eval: false` for code examples that shouldn't auto-run during render

### Slides (`.qmd` Reveal.js)

- YAML header includes `self-contained: true`, `slide-number: true`
- Use `{background="#2c3e50"}` for section divider slides
- Use `::: incremental` for bullet points that build
- Use `. . .` for pauses between blocks
- Keep each slide focused — one idea per slide

### Lab notebooks (`.ipynb`)

- Use markdown cells for setup, background, and instructions
- Structure: Overview → Setup → Problem sections → Reflection
- Clear all outputs before committing
- Include a ` ```python\n# Your code here\n``` ` placeholder for student work areas

## Python standards

- Prefer `pandas` method chaining over intermediate variables
- Use f-strings for string formatting
- Import style: `import pandas as pd`, `import numpy as np`, `import matplotlib.pyplot as plt`, `import seaborn as sns`
- DataFrames: snake_case names (e.g., `transactions`, `product_df`)

## AI tutor rules

- `tutor/allowed_sources.yml` — files the tutor may index
- `tutor/restricted_sources.yml` — files that must never be indexed
- `instructor/` is always restricted
- Answer keys, solution notebooks, quiz answers are always restricted

## Build commands

```bash
# Install Python dependencies
pip install -r requirements.txt

# Render the full book
quarto render

# Live preview (recommended during authoring)
quarto preview

# Render a single file
quarto render book/01-intro-data-mining.qmd

# Clear Quarto cache
quarto clean
```

## Adding new content

When adding a new chapter:
1. Create `book/NN-topic-name.qmd`
2. Add it to `_quarto.yml` under the correct module part
3. Add module/week metadata to `tutor/indexing_config.yml`
4. Run `quarto preview` to verify it renders

When adding a new slide deck:
1. Create `slides/week-NN.qmd`
2. Use the existing `week-01.qmd` as a template

When adding a new lab:
1. Create `labs/lab-NN-topic.ipynb`
2. Follow the lab notebook conventions above
3. Add to `tutor/allowed_sources.yml` (problem statement only)
4. Place answer key in `instructor/answer-keys/` (restricted)

## What NOT to do

- Do not commit Quarto cache files (`.quarto/`, `*_files/`)
- Do not commit notebook outputs — clear before committing
- Do not add instructor materials to allowed_sources.yml
- Do not generate content for graded assignments without explicit instruction
- Do not push `docs/` manually — let GitHub Actions handle deployment
