---
description: Create a new lab notebook or improve an existing one to align with the BANA 7025 75-minute lab structure (Part A guided + Part B independent challenges)
---

This skill runs in two modes depending on the argument:

- `/lab <module-number>` — **create** a new lab notebook for the given module
- `/lab improve <path>` — **improve** an existing lab notebook at the given path

---

## BANA 7025 Lab Structure

Every lab follows this 75-minute structure. Internalize it before generating any content.

```
Header & Setup
Part A: Guided Reinforcement         ~30 minutes  (TA-led, students follow along)
  ├── A1: Concept introduction + demo
  ├── A2: Hands-on walkthrough
  ├── A3: "Your Turn" practice exercises (students do work, TA circulates)
  └── A4: Check your understanding (discussion / compare results)
Class Q&A & Transition               5–10 minutes
Part B: Independent Challenges       35–40 minutes (group work, no starter code)
  ├── Challenge 1 — basic application
  ├── Challenge 2 — intermediate
  ├── Challenge 3 — multi-step
  ├── Challenge 4 — complex integration
  └── Challenge 5 — synthesis / open-ended
(Optional) Extension Activities
Wrap-up & Reflection                 3–5 minutes
```

**Non-negotiable rules for every lab:**
- Part B challenges have **zero starter code** — blank `# Your code here` cells only
- Part B instruction block states: *"Do not use AI to generate code. Work with your group to write it from scratch."*
- Every code example uses the standard import aliases: `pd`, `np`, `plt`, `sns`
- Business context frames every section — explain WHY, not just WHAT
- Time estimates appear in every section heading: `## Part A — Guided Reinforcement (~30 min)`
- Colab badge URL pattern: `https://colab.research.google.com/github/bradleyboehmke/uc-bana-7025/blob/main/labs/<filename>.ipynb`

**Graduate-level calibration (BANA 7025 is graduate):**
- Part A needs less step-by-step handholding than undergrad — explain concepts but trust students to execute
- Part B can have 5 challenges instead of 6, but they should be more integrative
- Hints in Part B should be conceptual, not syntactic
- Business scenarios should be realistic and moderately complex

---

## Mode 1: Create

**Triggered by:** `/lab <module-number>` (e.g., `/lab 2`)

### Step 1 — Identify module content

Read `_quarto.yml`. Find the `part:` entry for `book/module-NN-overview.qmd`. Extract the chapters list.

Read each chapter file in full. Identify:
- The 4–6 most important hands-on skills from the chapters (things students can *do*, not just know)
- Any datasets used in examples (note file paths)
- Common errors introduced in callout-warning blocks
- Any "Your Turn" / "Try It" exercises already in the chapters — these are signals for good lab exercises

Read `book/module-NN-overview.qmd` to get the module title and learning objectives.

### Step 2 — Determine filename and topic

Lab filename pattern: `lab-NN-<short-topic>.ipynb` where NN is the module number zero-padded (01, 02…) and short-topic is 2–4 words hyphenated (e.g., `lab-02-data-structures`).

If the module's chapters cover multiple distinct areas, choose the topic that is most central to the module's hands-on skills.

### Step 3 — Generate the notebook

Write `labs/<filename>.ipynb` as a valid Jupyter notebook JSON. Follow this cell structure precisely:

#### Cell 1 — Markdown: Header
```
# Week N Lab: <Descriptive Title>

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/bradleyboehmke/uc-bana-7025/blob/main/labs/<filename>.ipynb)

<2–3 sentence business context: why these skills matter in practice, what kind of analyst would use them>

## Learning Objectives
By the end of this lab, you will be able to:
- <objective 1 — measurable, starts with a verb>
- <objective 2>
- <objective 3>
- <objective 4>

## Lab Structure
**Total time:** 75 minutes | **Format:** Small groups (2–4 students)

| Segment | Duration |
|---------|---------|
| Part A: Guided Reinforcement | ~30 min |
| Class Q&A & Transition | ~5–10 min |
| Part B: Independent Challenges | ~35–40 min |
| Wrap-up & Reflection | ~3–5 min |

## This Lab Reinforces
- **Chapter N: <Title>**
- **Chapter N: <Title>**
- **Chapter N: <Title>**
```

#### Cell 2 — Markdown: Setup
```
## Setup
```

#### Cell 3 — Code: imports and data loading
```python
import pandas as pd
import numpy as np
# add other imports as needed

# Data loading if the module uses datasets
```

#### Cells 4–N: Part A (Guided Reinforcement, ~30 min)

Part A has 3–4 subsections. Each subsection follows this pattern:

**Markdown cell** — introduces the concept with 2–4 sentences of explanation + business context. No lengthy walls of text.

**Code cell** — a complete, runnable demonstration. Well-commented. 6–15 lines max. Shows the concept in action with realistic (not toy) data.

**Markdown cell** — "🧠 Your Turn" exercise. Gives a specific task (2–3 bullet points). No starter code — the student writes in the next cell.

**Code cell** — `# Your code here` only.

End Part A with a **"✅ Check Your Understanding"** markdown cell that has 2–3 discussion questions about what students just did.

#### Transition cell — Markdown: Class Q&A
```
## Class Q&A & Transition (~5–10 min)

Take a few minutes to compare your Part A results with another group. Questions to discuss:
- <discussion prompt 1>
- <discussion prompt 2>
```

#### Part B cells — Independent Challenges (~35–40 min)

**Opening markdown cell:**
```
## Part B — Independent Challenges (~35–40 min)

For each challenge below:
- **Start from a blank cell** — no starter code is provided
- **Do not use AI** to generate code; work with your group to write it from scratch
- **Ask your instructor** if you're stuck after 3–5 minutes
- We'll debrief each challenge as a class when time is called
```

**Each challenge** is two cells:

Markdown:
```
### Challenge N — <Title>

**Business question:** <a realistic, specific question requiring the skill>

**Hint:** <one conceptual sentence — method name or approach, not code>
```

Code: `# Your code here` only (nothing else)

Challenges should progress from simpler (single concept) to more integrative (combining multiple skills from Part A).

#### Optional Extension — Markdown + blank code cells
```
## (Optional) Extension

If your group finishes early:

### Extension 1 — <title>
<open-ended challenge that pushes beyond the lab content>

### Extension 2 — Explore
What other questions could you answer with this data? Write 2–3 questions and attempt one.
```

#### Wrap-up — Markdown cell
```
## Wrap-up & Reflection (~3–5 min)

### What You Practiced
- <skill 1>
- <skill 2>
- <skill 3>

### Reflection
Take 2 minutes individually, then share with your group:
- What was the trickiest part of today's lab?
- How would you use these techniques on a real dataset at work?
- What do you still want more practice with?

### Next Steps
- **Chapters:** Review <chapters> if anything from today needs clarification
- **Project:** <how today's skills connect to the semester project>
```

#### Troubleshooting — Markdown cell
```
## Troubleshooting

**`KeyError`**: The column name doesn't exist — check spelling with `df.columns`

**`AttributeError`**: Called a method on the wrong type — check `type(obj)` first

**`ValueError`**: Data type mismatch — check `df.dtypes`

<add 1–2 module-specific common errors based on callout-warning blocks in the chapters>
```

### Step 4 — Generate instructor answer key

Write `instructor/answer-keys/lab-NN-answer-key.ipynb` with complete solution code for every Part A "Your Turn" and every Part B challenge. Include comments explaining the solution approach and common student mistakes for each. This file is gitignored and never committed.

---

## Mode 2: Improve

**Triggered by:** `/lab improve <path>` (e.g., `/lab improve labs/lab-01-intro.ipynb`)

### Step 1 — Audit the existing notebook

Read the notebook. Evaluate it against the BANA 7025 lab structure above. Check for:

| Issue | What to look for |
|-------|-----------------|
| Missing structure | No clear Part A / Part B division |
| Colab badge URL | Should point to `uc-bana-7025`, correct filename |
| Missing time estimates | Section headings should include durations |
| Part B starter code | Part B cells should be blank except `# Your code here` |
| Missing "no AI" instruction | Part B intro must include this rule |
| Missing wrap-up | No reflection / next steps section |
| Missing troubleshooting | No error guidance section |
| Missing business context | Sections explain WHAT but not WHY |
| Weak learning objectives | Vague, or missing entirely |
| Code examples | Should use standard aliases; outputs should be cleared |

Report what you found — list every issue by category — before making any changes.

### Step 2 — Improve in place

Apply fixes to the notebook, preserving all existing content that is already correct. Do not rewrite sections that are fine. Specific fixes to apply:

- **Fix Colab badge URL** if wrong — update to match the correct filename and repo
- **Add Part A / Part B structure** if missing — reorganize existing content into the two-part framework; move guided examples into Part A, move independent exercises into Part B
- **Add time estimates** to section headings
- **Add the "no AI / no starter code" instruction** at the top of Part B if missing
- **Clear Part B code cells** — remove any starter code, leave only `# Your code here`
- **Add wrap-up section** at the end if missing — 3–5 reflection questions + next steps
- **Add troubleshooting section** at the end if missing — common errors for the module's content
- **Improve business context** in any section that is purely technical with no motivation
- **Fix learning objectives** if vague — rewrite to be specific and verb-led

### Step 3 — Report changes

After improving, summarize:
- What was changed and why (map to the issue list from the audit)
- What was kept as-is
- Whether an answer key needs to be created (if Part B challenges now exist but there is no key)

---

## File locations

| File | Path |
|------|------|
| Student lab | `labs/lab-NN-<topic>.ipynb` |
| Instructor answer key | `instructor/answer-keys/lab-NN-answer-key.ipynb` |

The `instructor/answer-keys/` directory is gitignored — answer keys are never committed.
