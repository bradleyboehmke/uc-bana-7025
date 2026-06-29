---
description: Scaffold one or more Canvas discussion prompts into properly formatted repo files under assignments/discussions/
---

The user has provided a week number and raw discussion prompt content (pasted text, a description, or both). Create the discussion file(s) for that week.

## Step 1 — Gather context

Read `book/module-NN-overview.qmd` (where NN matches the week number — weeks and modules are 1:1 in this course) to get the module title and topic scope. This informs the framing and instructor notes.

## Step 2 — Classify the discussion(s)

A week may have one or two discussions. Typical patterns:

| Type | Graded? | Purpose |
|------|---------|---------|
| **Introductory / reflective** | Yes | Students engage with course content conceptually or personally |
| **Peer support thread** | No | Open Q&A about setup, tools, or logistics for a specific week |

Determine which type(s) apply based on the content the user provided. If the user gave you two separate prompts, create two files. If they gave one, create one.

## Step 3 — Create the file(s)

**Filename pattern:** `assignments/discussions/week-NN-<short-slug>.md`

The slug is 2–4 words hyphenated describing the prompt (e.g., `introduce-yourself`, `python-setup`, `data-ethics-reflection`).

**File format — graded discussion:**

```markdown
# Discussion: [Title]

**Type:** Graded Discussion  
**Module:** N — [Module Title]  
**Points:** See Canvas

## Prompt

[Prompt content, formatted with bullet lists or paragraph as appropriate]
```

**File format — ungraded / peer support discussion:**

```markdown
# Discussion: [Title]

**Type:** Ungraded Discussion  
**Module:** N — [Module Title]  
**Points:** N/A

## Prompt

[Prompt content]

## Instructor Notes

[1–3 sentences on what to monitor or how to facilitate this thread]
```

**Content rules:**
- Preserve the user's prompt text faithfully — do not rewrite their words unless they ask
- Format lists as bullet points; keep paragraph text as-is
- For peer support threads, always include an `## Instructor Notes` section even if the user didn't provide one — write a brief facilitation note based on the module topic
- Do not add answer guidance, grading rubrics, or solution hints to any discussion file — those belong in `instructor/`

## Step 4 — Do NOT update allowed_sources.yml

Discussion files are graded student-facing assignments. They are not indexed by the AI tutor. Do not add entries to `tutor/allowed_sources.yml`.

## Step 5 — Report

List each file created with its path and type (graded / ungraded).
