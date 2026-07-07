---
description: Audit an entire BANA 7025 module — reads the module brief, compares existing content against source files, flags missing content, and produces a structured review report for human editing before implementation.
---

Audit all content for module N. Invoke as `/module:audit <N>` (e.g., `/module:audit 3`).

## Step 0 — Locate the brief

Look for `_reviews/module-NN-brief.md` (zero-padded, e.g., `_reviews/module-03-brief.md`). If not found, stop and tell the user to create it using the brief template at the bottom of this skill.

## Step 1 — Parse the brief

Read `_reviews/module-NN-brief.md` in full. Extract:

- **Module description** — what the module covers, porting goals, any context
- **Source files** — every path listed under `## Source Files` (BANA 4080 or other reference files to compare against)
- **Pasted resources** — all content under `## Pasted Resources`. Pasted content is not file-specific by default; apply it to whichever content type(s) it's most relevant to (e.g., a pasted discussion prompt informs the discussion file analysis; a pasted assignment question informs the homework analysis). When pasted content is used to justify a change, cite it in the `**Rationale:**` as "pasted resource: [brief description]".
- **Per-file guidance** — any specific instructions under `## Per-File Guidance`. These override or supplement the standard checklist for that file type. Incorporate per-file guidance as additional criteria during Step 3 analysis. When per-file guidance drives a change, include it in the `**Rationale:**` as "per-file guidance: [quote the instruction]".

Read all source files listed in the brief **in parallel** (multiple Read calls in a single message). Store their content — you'll use it when analyzing each 7025 file.

## Step 2 — Inventory existing BANA 7025 content

Read `_quarto.yml` and `book/module-NN-overview.qmd` to get the module title and chapter list.

Check whether each of the following files exists for module N. Use Bash `ls` or `find` on the relevant directories, or attempt a Read on each expected path and treat "file not found" as MISSING. Run these checks in parallel:

| Content type | Expected path pattern |
|---|---|
| Slides | `slides/week-NN.qmd` |
| Lecture notebook | `notebooks/tuesday-your-turn/week-NN-lecture.ipynb` |
| Lab | `labs/lab-NN-*.ipynb` |
| Homework | `assignments/homework/hw-NN*.md` or `*.ipynb` |
| Discussion | `assignments/discussions/module-NN*.md` |
| Quiz | `assignments/quizzes/module-NN*.md` |
| Cheat sheet | `book/module-NN-cheatsheet.qmd` |
| Book chapters | each chapter stem from `_quarto.yml` |

Record each as EXISTS or MISSING.

## Step 3 — Read and analyze all existing content

Read every EXISTS file **in parallel**. For each file, compare it against: (a) its source file from the brief, (b) BANA 7025 standards in CLAUDE.md, and (c) any per-file guidance from the brief.

Apply the relevant checklist per content type:

### Slides (`slides/week-NN.qmd`)

- Footer is `'BANA 7025 | Week N'` — not `BANA 4080`
- CSS is a two-item list: `styles.css` + `_extensions/martinomagnifico/appearance/appearance.css`
- No `uc-bana-4080` in any Colab badge URLs — should be `uc-bana-7025`
- Every major concept section has at least one ` ```{python} ` executable block (not just ` ```python `)
- Companion notebook callout present before the final slide (Colab badge pointing to `notebooks/tuesday-your-turn/week-NN-lecture.ipynb`)
- Think-Pair-Share timer pattern uses the correct HTML timer template with unique IDs
- Graduate-level calibration: complex business scenarios, no beginner handholding

### Lecture notebook (`notebooks/tuesday-your-turn/week-NN-lecture.ipynb`)

- Colab badge URL points to `uc-bana-7025` and the correct filename
- Setup cell loads completejourney_py (weeks 3+) or appropriate data
- Each concept section follows the 4-cell pattern: markdown header → code demo → "Try It" → blank `# Your code here` cell
- Every code cell produces visible output (print, display, or plot)
- All outputs cleared (`"outputs": []`, `"execution_count": null`)
- Listed in `tutor/allowed_sources.yml`

### Lab (`labs/lab-NN-*.ipynb`)

- Colab badge URL correct (repo = `uc-bana-7025`, filename matches)
- Clear Part A (guided, ~30 min) / Part B (independent, ~35–40 min) structure
- Section headings include time estimates (`(~30 min)`)
- Part B opens with "Do not use AI to generate code" instruction
- Part B challenge cells contain only `# Your code here` — no starter code
- Wrap-up and Troubleshooting sections present
- All outputs cleared

### Homework

- Business context frames every problem
- Problems use completejourney_py or course-supplied datasets (not toy data)
- Graduate-level complexity; BANA 4080 problems that are too basic flagged for replacement
- Matches any specific guidance from the brief

### Discussion

- Business scenario framing — not generic/abstract
- Graduate-level synthesis expected (not just recall)
- Formatted per `assignments/discussions/` conventions

### Quiz

- Correct student / instructor split (answer key gitignored)
- Formatted per `assignments/quizzes/` conventions

### Cheat sheet (`book/module-NN-cheatsheet.qmd`)

- File exists at `book/module-NN-cheatsheet.qmd`
- Listed in `_quarto.yml` under the Cheat Sheets part
- Linked from `book/module-NN-overview.qmd`

### Book chapters

- Starts with a short intro paragraph (2–4 sentences), no preamble heading
- Second element is `By the end of this chapter, you will:` bullet list
- Callouts use correct syntax: `{.callout-note}`, `{.callout-tip}`, `{.callout-warning}`
- Non-executable examples use ` ```python `, executable use ` ```{python} `
- `## Project Checkpoint` section present where applicable

## Step 4 — Write the review report

Write `_reviews/module-NN-review.md`. Produce one section per file, using this exact structure so `/module:implement` can parse it:

```
# Module N Review — [Module Title]
_Generated: YYYY-MM-DD | Status: DRAFT — edit before running `/module:implement N`_

## Brief Summary
_Source: `_reviews/module-NN-brief.md`_
[1–2 sentences: what the brief asked for and the porting strategy]

## Content Inventory

| File | Status | Changes | Action |
|------|--------|---------|--------|
| slides/week-NN.qmd | EXISTS | 3 | UPDATE |
| notebooks/tuesday-your-turn/week-NN-lecture.ipynb | MISSING | — | CREATE |
| labs/lab-NN-topic.ipynb | EXISTS | 0 | OK |
| assignments/homework/hw-NN.md | MISSING | — | CREATE |
| assignments/discussions/module-NN-discussion.md | EXISTS | 1 | UPDATE |
| book/module-NN-cheatsheet.qmd | MISSING | — | CREATE |

## Missing Content

The following files do not exist. Run the listed skill to create each one, then re-audit
or implement updates manually:

- `notebooks/tuesday-your-turn/week-NN-lecture.ipynb` → `/lecture:notebook N`
- `assignments/homework/hw-NN.md` → `/assignments:homework N`
- `book/module-NN-cheatsheet.qmd` → `/cheatsheet N`

---

## slides/week-NN.qmd

**Action:** UPDATE
**Source compared:** /path/to/bana-4080/source.qmd (or "none — no source file listed")

### Change 1 — [short title] [HIGH]
**Location:** [where in the file — YAML field name, heading, slide title, cell index]
**Current:**
```
[exact text to replace — must match the file precisely]
```
**Proposed:**
```
[exact replacement text]
```
**Rationale:** [one sentence explaining why]

### Change 2 — [short title] [MEDIUM]
**Location:** [landmark]
**Insert after:** [exact text that immediately precedes the insertion point]
**Content:**
```
[full block to insert]
```
**Rationale:** [one sentence]

---

## labs/lab-NN-topic.ipynb

**Action:** OK
No changes needed. File meets BANA 7025 standards.

---
```

**Rules for change blocks:**
- `Current:` text must be quoted exactly as it appears in the file — `/module:implement` uses it as a search string
- For insertions (new content with no current text to replace), use `**Insert after:**` instead of `**Current:**` + `**Proposed:**`
- If the `Insert after:` landmark text appears more than once in the file, add `**Insert at occurrence:** N` (1-indexed) to disambiguate
- Priority: `[HIGH]` = broken or wrong branding, `[MEDIUM]` = standards gap, `[LOW]` = polish
- If a proposed change is uncertain, add `**Note:** [flag for human review]` — the implement skill will skip flagged changes
- Do NOT include changes for MISSING files — those belong in the Missing Content section only

**Jupyter notebook change blocks (`.ipynb` files):**

For notebooks, reference cells by a 1-indexed cell number and a short content preview, since the JSON structure has no line numbers. Use this format:

```
### Change 1 — [title] [priority]
**Location:** Cell 3 (code cell starting with `import pandas as pd`)
**Current cell source:**
```
[exact cell source text]
```
**Proposed cell source:**
```
[replacement cell source text]
```
**Rationale:** [one sentence]
```

For the `Changes` column in the Content Inventory table: use `0` for EXISTS files with no issues found, and `—` for MISSING/CREATE files (file was not read).

## Step 5 — Report to user

Tell the user:
- Path to the review file
- Content inventory summary (X files audited, Y need updates, Z missing)
- List of missing content with the creation skill for each
- Reminder: "Review and edit `_reviews/module-NN-review.md`, then run `/module:implement N` to apply all UPDATE changes."

---

## Brief template

Copy this to `_reviews/module-NN-brief.md` to get started:

```markdown
# Module N Brief — [Module Title]

[2–4 sentences: what this module covers, the porting and update goals, any
context that should guide the review.]

## Source Files

<!-- List BANA 4080 or other source files to compare against existing 7025 content.
     The audit skill reads these alongside the current files. One path per line. -->

- /Users/b294776/Desktop/UC/uc-bana-4080/slides/wN_tuesday.qmd
- /Users/b294776/Desktop/UC/uc-bana-4080/labs/lab-NN-topic.ipynb
- /Users/b294776/Desktop/UC/uc-bana-4080/assignments/homework/hw-NN.md
- /Users/b294776/Desktop/UC/uc-bana-4080/assignments/discussions/module-NN-discussion.md

## Pasted Resources

<!-- Paste raw content here: discussion forum posts, old assignment text,
     notes, or anything the audit should factor in when proposing changes. -->

## Per-File Guidance

<!-- Optional: specific instructions for individual files. -->

- **Slides:** [any specific guidance]
- **Homework:** [e.g., "reuse problems 1–3, replace problem 4 with method chaining focus"]
- **Discussion:** [e.g., "use the retail analytics framing from the pasted content above"]
- **Lab:** [e.g., "Part B should be more open-ended than the BANA 4080 version"]
```
