---
description: Format raw quiz questions into a student-facing quiz file and a separate instructor answer key (gitignored), enforcing the student/instructor split automatically
---

The user has provided a week number and quiz content (pasted questions, a description of topics to cover, or both). Create the student-facing quiz and the instructor answer key.

## Step 1 — Gather context

Read `book/module-NN-overview.qmd` to get the module title. Read the chapter files listed in `_quarto.yml` for that module — you'll need the chapter titles for the quiz header and may need to derive questions from chapter content if the user hasn't provided them.

## Step 2 — Determine question source

**If the user pasted raw questions:** Use them as-is, reformatting into the standard structure below. Identify the question type for each (True/False, Multiple Choice, Multiple Select, Fill in the Blank) from context — if a question has exactly two options (True/False), it's T/F; if it has four options and one answer, it's MC; if multiple answers apply, it's Multiple Select; if it has a blank, it's Fill in the Blank.

**If the user described topics but didn't provide questions:** Write 10–14 questions covering the module's key concepts — conceptual knowledge and high-level comprehension, not coding syntax. Use a mix of question types. Prioritize concepts that appear in chapter headings, bold terms, callout boxes, and "Your Turn" exercises.

Aim for 10–14 questions total. Mix of types:
- 2–3 True/False
- 4–5 Multiple Choice (one correct answer)
- 2–3 Multiple Select (multiple correct answers)
- 1–2 Fill in the Blank

## Step 3 — Write the student-facing quiz

**Path:** `assignments/quizzes/week-NN-quiz.md`

**Format:**

```markdown
# Week N Reading Quiz

**Module:** N — [Module Title]  
**Chapters:** N (Title), N (Title)[, N (Title)]  
**Points:** [N] (1 pt per question)  
**Time limit:** 40 minutes  
**Attempts:** Up to 2 — final score is the average of both attempts

> Questions focus on conceptual knowledge and high-level comprehension rather
> than coding. If you don't feel confident after the first try, review the lesson
> materials and try again.

---

**Question 1** — *[Question Type]*

[Question text]

- Option A
- Option B
- Option C
- Option D

---

**Question 2** — *[Question Type]*

...
```

**Question type labels:** `True/False`, `Multiple Choice`, `Multiple Select`, `Fill in the Blank`

**Multiple Select questions** must include the instruction: `*(Select all that apply)*` on its own line after the question text.

**Fill in the Blank questions** use a `__________` (10 underscores) placeholder within the sentence.

**No answers, no hints, no correct-answer indicators** in this file — it is student-facing only.

## Step 4 — Write the instructor answer key

**Path:** `instructor/answer-keys/week-NN-quiz-key.md`

This file is gitignored and never committed. Write it as a complete instructor reference.

**Format:**

```markdown
# Week N Reading Quiz — Answer Key

**Module:** N — [Module Title]  
**Total points:** N

---

**Question 1** — *[Question Type]*

[Question text repeated]

- Option A
- ✅ Option B — [1-sentence explanation of why this is correct]
- Option C — [brief note on why this is wrong, if non-obvious]
- Option D — [brief note on why this is wrong, if non-obvious]

---

**Question 2** — *[Question Type]*

...
```

**Answer key rules:**
- Mark every correct answer with `✅`
- For each **wrong** answer option, add a brief inline note explaining the misconception it targets — keep it to one clause (e.g., `— confuses assignment with comparison`)
- For **Fill in the Blank**, give the exact expected answer plus 1–2 acceptable variations
- For **Multiple Select**, mark every correct option with `✅`; list how many correct options there are at the top of the question
- Do not include grading rubrics or point breakdowns — Canvas handles scoring

## Step 5 — Enforce the split

Before finishing, verify:
- The student file (`assignments/quizzes/`) contains **zero** answer indicators (`✅`, "correct", "answer is")
- The answer key (`instructor/answer-keys/`) is the only file with answer content
- Do **not** update `tutor/allowed_sources.yml` — quizzes are graded and must not be indexed by the AI tutor

## Step 6 — Report

Confirm both files created, note the path of each, and remind the user that the answer key is gitignored and will not be committed.
