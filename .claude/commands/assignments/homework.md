---
description: Create a homework assignment and instructor answer key for a given week, either from a description of topics or from pasted problem content
---

The user has provided a week number and either a description of what the homework should cover or the raw problem content. Create the student-facing homework file and the instructor answer key.

## Step 1 — Gather context

Read `_quarto.yml` to identify the module's chapters for the given week. Read each chapter file to understand:
- The key skills and concepts that are appropriate for independent practice
- Any datasets referenced that students have access to (`data/` directory or `completejourney_py`)
- The difficulty level and coding patterns introduced

Read `book/module-NN-overview.qmd` to get the module title.

## Step 2 — Determine format

Homework can be one of two formats depending on content:

**Markdown format** (`week-NN-homework.md`) — for assignments that are primarily conceptual questions, short written responses, or simple code snippets students type themselves. Use when the homework is lightweight or concept-focused.

**Notebook format** (`week-NN-homework.ipynb`) — for assignments that require running code, working with datasets, or producing output. Use when the problems involve pandas, plotting, or file I/O. Structure it like a lab notebook (markdown cells for instructions, blank code cells for student work) but without the Part A/B structure — homework is fully independent.

If uncertain, default to **markdown** for Module 1–2 content and **notebook** for Module 3+.

## Step 3 — Write the student-facing homework

**Path:** `assignments/homework/week-NN-homework.md` or `assignments/homework/week-NN-homework.ipynb`

### Markdown format structure:

```markdown
# Week N Homework: [Descriptive Title]

**Module:** N — [Module Title]  
**Chapters:** N (Title)[, N (Title)]  
**Points:** See Canvas  
**Due:** See Canvas

## Overview

[2–3 sentences on what this homework covers and why it matters. Connect to the module's business context.]

## Instructions

- Complete all problems below
- Show your work — partial credit may be awarded for correct reasoning
- Submit via Canvas by the due date

---

## Problem 1 — [Title] ([points] pts)

[Problem statement. Clear, specific, self-contained.]

[For code problems: describe the task; do not provide starter code]

---

## Problem 2 — [Title] ([points] pts)

...

---

## (Optional) Bonus — [Title]

[Optional extension problem for students who want an extra challenge]
```

### Notebook format structure:

Follow the lab notebook conventions from `CLAUDE.md`:
- Markdown cells for overview, instructions, and each problem statement
- Blank code cells (`# Your code here`) for student work
- No starter code, no example solutions
- Clear all outputs before saving

**Colab badge** in the header:
```
[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/bradleyboehmke/uc-bana-7025/blob/main/assignments/homework/week-NN-homework.ipynb)
```

### Content rules for all formats:
- 4–6 problems of increasing difficulty
- Each problem is self-contained and unambiguous
- Problems should require applying — not just recalling — the week's concepts
- For data problems, specify which dataset to use and any filtering/setup needed
- No answer hints, example outputs, or solution guidance in the student file

## Step 4 — Write the instructor answer key

**Path:** `instructor/answer-keys/week-NN-homework-key.md` (or `.ipynb` if the homework is a notebook)

**Content:**
- Repeat each problem statement
- Provide a complete, correct solution (full code for coding problems, full written response for conceptual problems)
- Add a brief grading note for each problem: what earns full credit, what common mistakes to watch for, and whether partial credit is appropriate
- For coding problems, include at least one alternative valid approach if one exists

**Format example:**

```markdown
# Week N Homework — Answer Key

**Module:** N — [Module Title]

---

## Problem 1 — [Title]

**Solution:**
[Complete answer or code]

**Grading notes:**
- Full credit: [what earns full marks]
- Partial credit: [what earns partial marks, if applicable]
- Common mistakes: [what students frequently get wrong]

---
```

## Step 5 — Enforce the split

Before finishing, verify:
- The student file contains **no** answer content, example outputs, or solution hints
- The answer key is only in `instructor/answer-keys/` (gitignored)
- Do **not** update `tutor/allowed_sources.yml` — homework is graded and must not be indexed by the AI tutor

## Step 6 — Report

List both files created with their paths. Note the format chosen (markdown vs notebook) and why. Remind the user the answer key is gitignored and will not be committed.
