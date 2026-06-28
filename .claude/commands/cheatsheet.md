---
description: Generate a module cheat sheet from chapter content, create the .qmd file, add it to _quarto.yml under Cheat Sheets, and link it from the module overview page
---

The user has provided a module number (e.g., `/cheatsheet 2`). Create a cheat sheet for that module.

## Step 1 — Identify the module's chapters

Read `_quarto.yml`. Find the `part:` entry for `book/module-NN-overview.qmd` (where NN is the zero-padded module number). Extract the `chapters:` list under that part — these are the source files. Strip `book/` prefix and `.qmd` suffix to get each chapter stem (e.g., `book/04-jupyter.qmd` → `04-jupyter`).

Also read `book/module-NN-overview.qmd` to get the module title (first heading) and the chapter titles listed in the Chapters & Notebooks table.

## Step 2 — Read the chapter files

Read each chapter `.qmd` file in full. For each chapter, identify:

- The major `##` section headings and what each covers
- Key terms that are defined or introduced (look for bold text, blockquotes, or explicit definitions)
- Code patterns that appear repeatedly or are introduced for the first time — focus on the 4–8 most important
- Common mistakes or "gotcha" notes (callout-warning blocks are a signal)
- The Quarto-generated anchor for each heading: lowercase, spaces replaced with hyphens, punctuation stripped (e.g., `## Why Python?` → `#why-python`)

## Step 3 — Write the cheat sheet

Create `book/module-NN-cheatsheet.qmd` with the following structure:

### YAML header
```
---
title: "Module N Cheat Sheet"
subtitle: "Key concepts, definitions, and code from Chapters X–Y"
---
```
The subtitle chapter range is the actual chapter numbers (e.g., chapters 4–6 for module 2). Derive chapter numbers by counting from the start of the book across all modules in order.

### Intro line
One sentence: `A quick-reference summary of the essential ideas from Module N. Click any section heading to jump to the full coverage in the book.`

Then `---`.

### Content sections

Write one section per major concept cluster — typically 2–4 sections per chapter, 6–12 sections total for the module. Each section follows this pattern:

```markdown
## [Section Title](chapter-stem.html#anchor) {.unnumbered}
```

The link uses `chapter-stem.html` (not the `.qmd` path) and the `#anchor` for the relevant section heading in that chapter.

Within each section, use whichever of these elements fit the content:

- **Definition blockquote** for core terms:
  ```
  > **Term** is the definition in one sentence.
  ```
- **Table** for comparisons, syntax summaries, or option lists
- **Code block** (fenced with ` ```python `) for syntax patterns — keep examples short (4–8 lines), use comments to annotate
- **Callout** (`{.callout-tip}` or `{.callout-warning}`) sparingly for the single most important tip or warning per section
- **Bullet list** for short enumerations

Every section ends with `---`.

### Common Pitfalls section

End the cheat sheet with:

```markdown
## Common Pitfalls {.unnumbered}

| Mistake | Why it happens | Fix |
|---------|---------------|-----|
| ...     | ...           | ... |
```

Include 4–6 rows covering the most common errors students make with the module's content. Draw these from callout-warning blocks in the chapters, or from concepts where type errors, off-by-one errors, or syntax confusion are likely.

### Content rules

- **Be succinct.** One well-chosen code example beats three mediocre ones. One row in a table beats a paragraph.
- **Every code block must be valid Python** — no pseudocode, no ellipses as placeholders.
- **Link every section heading** to the corresponding chapter section using the `.html#anchor` pattern.
- **Do not use `{python}` executable code blocks** — use plain ` ```python ` fences. The cheat sheet is reference material, not a notebook.
- **No `## Project Checkpoint` section** — cheat sheets are concept references, not assignment prompts.

## Step 4 — Update `_quarto.yml`

Open `_quarto.yml` and find the `"Cheat Sheets"` part:

```yaml
- part: "Cheat Sheets"
  chapters:
    - book/module-01-cheatsheet.qmd
```

Add `book/module-NN-cheatsheet.qmd` to the chapters list in module order. If the entry already exists, skip this step.

## Step 5 — Update the module overview page

Open `book/module-NN-overview.qmd`. Find the `### Reference {.unnumbered}` section. If it already contains a cheat sheet link, skip. If it does not exist or has no cheat sheet link, add or update it:

```markdown
### Reference {.unnumbered}

| Resource | Link |
|----------|------|
| 📋 Module N Cheat Sheet | [View cheat sheet](module-NN-cheatsheet.html){target="_blank"} |
```

The Reference section should appear **after** the Lab section.

## Step 6 — Report

After all files are written, summarize:
- File created: `book/module-NN-cheatsheet.qmd` with N sections
- `_quarto.yml` updated (or already current)
- `book/module-NN-overview.qmd` Reference section updated (or already current)
