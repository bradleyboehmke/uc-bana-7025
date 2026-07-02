---
description: Apply approved changes from a BANA 7025 module review report — reads _reviews/module-N-review.md and executes all UPDATE change blocks across course files without asking for per-edit confirmation.
---

Apply the approved changes from a module review report. Invoke as `/module:implement <N>` (e.g., `/module:implement 3`).

This skill assumes you have already reviewed and approved `_reviews/module-NN-review.md`. It applies every UPDATE change block exactly as written. The review file is the human approval gate — implement runs without further confirmation on individual edits.

## Step 0 — Locate the review

Look for `_reviews/module-NN-review.md` (e.g., `_reviews/module-03-review.md`).

If not found, stop: "No review file found. Run `/module:audit N` first to generate one, then edit it to approve the proposed changes."

Read the review file in full before touching any course files.

## Step 1 — Parse the review

From the **Content Inventory** table, collect every file entry and its Action:

| Action | Meaning |
|---|---|
| `UPDATE` | Changes to apply — work through each `### Change N` block |
| `OK` | No changes — skip |
| `CREATE` | File doesn't exist — skip and flag for user |
| `MISSING` | File doesn't exist — skip and flag for user |

For each `UPDATE` file, collect its change blocks in order. Each `### Change N — [title] [priority]` block is one of two types:

**Replacement block** — has `Current:` + `Proposed:`:
```
### Change 1 — Footer branding [HIGH]
**Location:** YAML header, `footer:` field
**Current:**
```
footer: 'BANA 4080 | Week 3'
```
**Proposed:**
```
footer: 'BANA 7025 | Week 3'
```
**Rationale:** Wrong course branding.
```

**Insertion block** — has `Insert after:` + `Content:`:
```
### Change 2 — Companion notebook callout [MEDIUM]
**Location:** Before the final Q&A slide
**Insert after:** [exact landmark text]
**Content:**
```
[full block to insert]
```
**Rationale:** Required per CLAUDE.md slide standards.
```

Skip any change block that contains `**Note:**` — these are flagged for human review and should not be auto-applied.

## Step 2 — Apply changes file by file

Process each UPDATE file one at a time. Read the current file first, then apply all its change blocks in order.

### Replacement blocks

1. Search the file for the exact text in `Current:`
2. Replace it with the exact text in `Proposed:`
3. If the exact `Current:` text is not found in the file:
   - Do **not** attempt a fuzzy match or partial replacement
   - Record it as "not applied — current text not found"
   - Continue to the next change block

### Insertion blocks

1. Search the file for the exact text in `Insert after:`
2. Insert the `Content:` block immediately after that text, with a blank line separating them
3. If the `Insert after:` landmark is not found:
   - Record it as "not applied — landmark not found"
   - Continue to the next change block

### Jupyter notebooks

For `.ipynb` files, treat the JSON structure directly:
- Replacement blocks apply within `"source"` arrays of matching cells
- Insertion blocks add a new cell after the cell whose source contains the `Insert after:` text
- Always preserve `"outputs": []` and `"execution_count": null` on any cell you touch
- Validate the JSON is well-formed after edits

### Important rules

- Apply changes exactly as written — do not interpret, improve, or expand them
- Do not make any change not listed in the review file
- Do not create new files — CREATE actions are handled by the individual creation skills
- Do not modify files marked OK

## Step 3 — Report results

After all files are processed, report:

**Applied** (list each file with count):
```
slides/week-03.qmd — 3 of 3 changes applied
assignments/discussions/module-03-discussion.md — 1 of 1 change applied
```

**Not applied** (changes that were skipped because the search text wasn't found):
```
slides/week-03.qmd — Change 2 "CSS update" not applied: current text not found
  Expected: `css: styles.css`
  Check whether the file was already updated or the review is stale.
```

**Skipped — needs creation skill** (list with command):
```
notebooks/tuesday-your-turn/week-03-lecture.ipynb → /lecture:notebook 3
assignments/homework/hw-03.md → /assignments:homework 3
book/module-03-cheatsheet.qmd → /cheatsheet 3
```

**Skipped — flagged for review** (changes with `**Note:**`):
```
slides/week-03.qmd — Change 4 "Graduate calibration" flagged for manual review
```

Close with: "Run `quarto preview` to verify the changes render correctly before committing."
