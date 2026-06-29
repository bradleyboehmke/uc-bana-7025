---
description: Create or update the weekly lecture slide deck for BANA 7025 — fixes BANA 4080 branding, upgrades code demos to executable, and adds companion notebook reference
---

Create or update the Tuesday lecture slides for the given week. Invoke as `/lecture:slides <week-number>` (e.g., `/lecture:slides 3`).

## Step 1 — Identify module content

Read `_quarto.yml`. Find the `part:` entry for `book/module-NN-overview.qmd` where NN matches the week number. Extract the chapters list for that module.

Read each chapter file to identify:
- The 3–5 most important concepts introduced that week
- Any executable code examples or datasets used
- Business scenarios and real-world contexts
- "Your Turn" / practice exercises that signal good demo material

Read `book/module-NN-overview.qmd` to get the module title and learning objectives.

## Step 2 — Determine mode

Check whether `slides/week-NN.qmd` exists (zero-padded, e.g., `week-02.qmd`).

**Port/Fix mode** — file exists, open it and audit for:
- Footer containing `BANA 4080` instead of `BANA 7025 | Week N`
- Colab badge or notebook links pointing to `uc-bana-4080` instead of `uc-bana-7025`
- CSS referencing only `styles.css` instead of both `styles.css` and `_extensions/martinomagnifico/appearance/appearance.css`
- Concept sections with no executable code (only plain ` ```python ` fences) that should have `{python}` live demos
- Missing companion notebook callout (see Step 4)

**Create mode** — file does not exist:
- Check if a corresponding BANA 4080 source exists at `/Users/b294776/Desktop/UC/uc-bana-4080/slides/` using the pattern `wN_tuesday.qmd` or `w[N]_tuesday.qmd`
- If BANA 4080 source exists: port it (apply all Port/Fix mode fixes above, plus adapt content for graduate level)
- If no source exists: create from scratch using chapter content following the structure in Step 3

## Step 3 — Slide structure (for create mode or major additions)

The slide deck covers a 60–75 minute Tuesday lecture. Follow this structure:

```
YAML Header (see Step 4 for exact format)

Opening & Agenda (5 min)
├── Week N agenda slide
└── Learning objectives for the week

Recap (10–15 min)
├── Week N-1 concept review (incremental bullets)
└── Think-Pair-Share: connect prior week to this week

Main Content Sections (35–45 min)
  For each major concept (typically 3–4 sections):
  ├── Section header slide {background="#43464B"}
  ├── Motivation slide: business problem that requires this concept
  ├── Concept explanation slide(s)
  ├── Executable code demo slide (see Code Demo standards below)
  └── Think-Pair-Share or mini challenge activity

Thursday Lab Preview (5 min)
└── What students will practice hands-on in lab

Wrap-up (5–10 min)
├── Key takeaways
├── Companion notebook callout (see Step 4)
└── Q&A
```

**Think-Pair-Share activities** — minimum 2–3 per deck:
- Include a countdown timer with a unique ID per activity
- Business scenario context (not abstract)
- 2–4 discussion questions
- Timer range: 3 min (quick concept check) to 5 min (scenario analysis)

Timer pattern:
```html
:::: {.columns}
::: {.column width="70%"}
[discussion prompt here]
:::
::: {.column width="30%"}
<center>
<div id="[uniqueId]"></div>
<script src="_extensions/produnis/timer/timer.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        initializeTimer("[uniqueId]", [seconds], "slide");
    });
</script>
</center>
:::
::::
```

**Code Demo standards** — this is the core upgrade for student interactivity:
- Use `{python}` executable blocks (not plain ` ```python ` fences) for all live demonstrations
- Each major concept section should have at least one executable demo
- Demo code should: (1) solve a realistic business problem, (2) be runnable top-to-bottom without hidden state, (3) produce visible output (print, display, or plot)
- Keep each demo to 8–15 lines — enough to be meaningful, short enough to fit a slide
- Add a brief "Key Insight:" callout after the code block explaining the business relevance
- For computationally expensive operations, add `#| cache: true`

Example of a good code demo slide:
```markdown
## DataFrames in Action {.smaller}

How a data analyst checks data quality before a presentation:

```{python}
import pandas as pd
from completejourney_py import get_data

transactions = get_data()['transactions']

# Quick data quality check: shape, missing values, dtypes
print(f"Shape: {transactions.shape}")
print(f"\nMissing values:\n{transactions.isnull().sum()[transactions.isnull().sum() > 0]}")
print(f"\nKey dtypes:\n{transactions.dtypes}")
```

::: {.callout-important}
**Key Insight:** Always run this trio before any analysis — it prevents surprises mid-presentation.
:::
```

## Step 4 — Specific fixes to always apply

**YAML header** — the correct format for BANA 7025 slides:
```yaml
---
title: "Week N – [Topic]"
subtitle: "[Subtitle]"
format:
  revealjs:
    self-contained: true
    slide-number: true
    preview-links: auto
    revealjs-plugins:
      - appearance
      - highlight-text
    css:
      - styles.css
      - _extensions/martinomagnifico/appearance/appearance.css
    mermaid:
      theme: neutral
footer: 'BANA 7025 | Week N'
title-slide-attributes:
    data-background-image: images/[image-name]
    data-background-size: cover
    data-background-opacity: "1.0"
filters:
  - timer
execute:
  echo: true
---
```

**Footer** — always `'BANA 7025 | Week N'` (never `'BANA 4080'`)

**CSS** — always two-element list (not single string):
```yaml
css:
  - styles.css
  - _extensions/martinomagnifico/appearance/appearance.css
```

**Colab links** — replace all occurrences of `uc-bana-4080` in URLs with `uc-bana-7025`

**Companion notebook callout** — add this before the Q&A / final slide:
```markdown
## Follow Along in the Companion Notebook

::: {.callout-tip}
## Week N Lecture Notebook

The concepts from today's lecture are fully worked out in the companion notebook — including runnable code, additional examples, and "Try It" exercises.

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/bradleyboehmke/uc-bana-7025/blob/main/notebooks/tuesday-your-turn/week-NN-lecture.ipynb)

Open it now and follow along, or use it after class as a reference.
:::
```

## Step 5 — Graduate-level calibration

BANA 7025 is a graduate course. When porting or creating content:
- Less hand-holding than BANA 4080 — trust students to execute after seeing a demo once
- Business scenarios can be more complex and multi-step
- Code examples can use `completejourney_py` data from the start (not toy data)
- Think-Pair-Share questions can require synthesis, not just recall
- Skip "what is Python?" level content; assume students can read documentation

## Step 6 — Save and report

Save the updated or created file at `slides/week-NN.qmd`.

Report:
- Mode used (port/fix vs create)
- List of every change made (branding fixes, Colab link updates, code demos added/converted, callout added)
- Any slides that still use placeholder images (list them so the instructor can address)
- Remind the user: **run `/lecture:notebook N` next** to create the companion notebook students follow during class
