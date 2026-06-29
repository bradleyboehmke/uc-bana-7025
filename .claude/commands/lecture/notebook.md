---
description: Create the companion Jupyter notebook for a weekly lecture — a section-by-section executable version of the slides that students follow during class and reference afterward
---

Create the lecture companion notebook for the given week. Invoke as `/lecture:notebook <week-number>` (e.g., `/lecture:notebook 3`).

This notebook is **not a lab**. It is a follow-along reference that mirrors the Tuesday lecture slides. Students open it during class to execute the demos the instructor shows, then keep it as a reference after class. There is no Part A/B structure, no "no AI" rule, and no grading component.

## Step 1 — Gather context

Read `_quarto.yml`. Find the module for the given week. Extract the chapter list.

Read `slides/week-NN.qmd`. Identify:
- The major sections and their titles (use these to structure the notebook sections)
- Every code block in the slides — both executable `{python}` blocks and plain ` ```python ` fences
- Every Think-Pair-Share prompt (these become "Try It" exercises in the notebook)
- Any datasets, imports, or business scenarios used

Read each chapter file for the week to extract:
- Deeper code examples and variations not shown in slides
- Concept explanations that complement (not repeat) the slide narrative
- Common pitfalls mentioned in callout-warning blocks

Read `book/module-NN-overview.qmd` for the module title.

## Step 2 — Notebook structure

Write `notebooks/tuesday-your-turn/week-NN-lecture.ipynb` as a valid Jupyter notebook JSON. Use this cell layout:

### Cell 1 — Markdown: Header

```
# Week N Lecture: [Descriptive Title]

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/bradleyboehmke/uc-bana-7025/blob/main/notebooks/tuesday-your-turn/week-NN-lecture.ipynb)

[2–3 sentences: what this week covers and why it matters in practice. Connect to a realistic analyst or business context.]

## How to use this notebook

This notebook accompanies the Week N Tuesday lecture. You can:

- **Follow along during class** — run each cell as the instructor discusses it
- **Pause and experiment** — modify the code to test your understanding
- **Reference after class** — use it alongside the textbook chapters

## This Week's Topics

- **[Chapter N: Title]** — [one-sentence description]
- **[Chapter N: Title]** — [one-sentence description]
- **[Chapter N: Title]** — [one-sentence description]
```

### Cell 2 — Markdown: Setup

```
## Setup
```

### Cell 3 — Code: imports and data loading

```python
import pandas as pd
import numpy as np
# add other imports as needed for this week

# Load data if the week uses completejourney_py or a CSV
# from completejourney_py import get_data
# data = get_data()
```

### Cells 4–N: One section per major lecture concept

Each section follows this exact four-cell pattern:

**Cell A — Markdown: Section header + context**
```
## [Section Title from Slides]

[2–4 sentences explaining the concept and why it matters. 
Mirror the slide's framing but expand with more detail.
Include the business problem this concept solves.]
```

**Cell B — Code: Full runnable demonstration**
```python
# [Business context comment explaining what we're doing and why]

# [Step 1 — setup or load the data]
...

# [Step 2 — apply the concept]
...

# [Step 3 — show or print the result with meaningful output]
...
```

This cell should:
- Be longer and more complete than the slide's version (the slide abbreviates; the notebook has the full story)
- Produce visible output when run (print, display, or plot)
- Use realistic data (completejourney_py when relevant, otherwise small but realistic inline data)
- Include inline comments that explain each meaningful step
- Be executable top-to-bottom with a clean kernel

**Cell C — Markdown: Try It exercise**
```
### Try It

[Specific task derived from the Think-Pair-Share or mini-challenge in the slides.
2–3 bullet points describing exactly what to do.
The task should require applying the concept just demonstrated — not just recalling it.]
```

**Cell D — Code: blank workspace**
```python
# Your code here
```

### After the last section — Markdown: Wrap-up

```
## Summary

| Concept | Key Takeaway |
|---------|-------------|
| [Concept 1] | [one-line takeaway] |
| [Concept 2] | [one-line takeaway] |
| [Concept 3] | [one-line takeaway] |

## What's Next

- **Thursday Lab:** [brief description of what students will practice in the lab]
- **Chapters to review:** [chapter numbers and titles] if anything from today needs clarification
- **Cheat sheet:** [link to the module cheat sheet if it exists in the book]
```

## Step 3 — Code quality standards

Every executable code cell must meet these standards:

- **Self-contained within the notebook**: imports at the top, no hidden state required
- **Produces output**: print statements, DataFrame displays, or plots — never silent cells
- **Uses standard aliases**: `pd`, `np`, `plt`, `sns`
- **Realistic data**: prefer `completejourney_py` for weeks 3–7; use small inline dicts/lists for weeks 1–2
- **No placeholders**: every cell runs without modification
- **Clear comments**: explain the "why" of each step, not just the "what"

For weeks using completejourney_py, load data once in the Setup cell and reuse:
```python
from completejourney_py import get_data
cj = get_data()
transactions = cj['transactions']
products = cj['products']
# etc.
```

## Step 4 — Notebook vs lab distinction

This is a companion notebook, not a lab. Key differences:

| | Companion Notebook | Lab Notebook |
|--|-------------------|-------------|
| Structure | Mirrors lecture sections | Part A (guided) + Part B (independent) |
| Starter code | Yes — full demos provided | Part B has none |
| AI use | Not restricted | Explicitly prohibited in Part B |
| Graded | No | Yes |
| Purpose | Follow along + reference | Independent skill practice |

Do NOT add "no AI" instructions. Do NOT use Part A/Part B framing.

## Step 5 — Clear outputs and update allowed sources

Before saving, clear all cell outputs from the notebook JSON — set every cell's `outputs` to `[]` and `execution_count` to `null`.

After creating the notebook, add it to `tutor/allowed_sources.yml` under the appropriate module section, since this is non-graded student-facing content. Use this format:

```yaml
- path: notebooks/tuesday-your-turn/week-NN-lecture.ipynb
  description: "Week N lecture companion notebook — runnable examples for [topic list]"
  module: N
  type: lecture_notebook
```

## Step 6 — Report

List:
- File path created
- Sections included (one line each)
- Number of runnable code demos
- Number of "Try It" exercises
- Whether `tutor/allowed_sources.yml` was updated
- Remind the user: clear outputs before committing (`quarto clean` or manually); confirm the slides exist at `slides/week-NN.qmd` (run `/lecture:slides N` first if not)
