---
description: Audit and update meta files (CLAUDE.md, README.md, index.qmd, tutor/indexing_config.yml) to match the current book structure in _quarto.yml
---

You are syncing the BANA 7025 course meta files so they accurately reflect the current state of the repository. The source of truth for book structure is `_quarto.yml`.

## Step 1 — Read source of truth

Read these files in full before making any changes:

1. `_quarto.yml` — extract every `part:` (module overview page) and its `chapters:` list. Strip the `book/` prefix and `.qmd` suffix from chapter paths to get the chapter stem (e.g., `book/01-intro-data-mining.qmd` → `01-intro-data-mining`). Note the "Cheat Sheets" part and `appendices:` separately — they are not modules.
2. Each `book/module-NN-overview.qmd` that exists — extract the module title (first heading) and the one-sentence module description from the opening paragraph.
3. `slides/` directory listing — note which `week-NN.qmd` files exist.
4. `labs/` directory listing — note which `lab-NN-*.ipynb` files exist.
5. `assignments/` directory listing — note which discussions, quizzes, and homework files exist.
6. `book/module-NN-cheatsheet.qmd` files — note which modules have cheat sheets.

## Step 2 — Audit each meta file

Compare each meta file against the source-of-truth data. For each file, list exactly what is out of date before editing anything.

### `CLAUDE.md`

Check the **Module → chapter mapping** table:
- Column "Chapters" should list the actual chapter stems from `_quarto.yml`, not planned/renamed stems
- Module count and week numbers should match what's in `_quarto.yml`
- The build command example (`quarto render book/NN-...qmd`) should reference a chapter that actually exists

### `README.md`

Check the **Course structure** table (Module | Week | Topics):
- Module count should match `_quarto.yml`
- Topics column should reflect the module title or key subjects from the module overview page

Check the **Repository structure** tree:
- Directory list should include any directories added since the tree was last written (e.g., `assignments/discussions/`, `assignments/quizzes/`, `.claude/commands/`)

### `index.qmd`

Check the **"How to use this book"** table (Module | Topics | Chapters):
- Chapter number ranges should be consistent with the actual chapter count per module in `_quarto.yml`
- If a new module has been added or chapter counts have changed, update the range

### `tutor/indexing_config.yml`

Check the `modules:` list:
- `chapters:` under each module must list the actual chapter stems from `_quarto.yml` (not planned names)
- `topics:` should be consistent with the module's actual content based on chapter titles
- Module count should match `_quarto.yml`

## Step 3 — Apply updates

For each file with discrepancies, make the targeted edits. Do not rewrite content that is not out of date. Do not change prose, conventions sections, or anything outside the specific tables/lists being synced.

After editing, briefly report:
- Which files were changed and what specifically was updated
- Which files were already current (no changes needed)

## Flags

If the user passed `--dry-run`, report the discrepancies found in Step 2 but do not apply any edits.

If the user passed a specific file flag (`--claude`, `--readme`, `--index`, `--tutor`), only audit and update that file.
