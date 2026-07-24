# Week 5 Homework – Project Proposal

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/bradleyboehmke/uc-bana-7025/blob/main/assignments/homework/week-05-project-proposal-v2.ipynb)

## Overview

This is a **group submission**. One person on your team submits on behalf of the group through the Canvas Group assignment.

In this week's lab, your group brainstormed three project ideas and pitched one to the class. Now it's time to develop that idea — or a refined version of it — into a formal proposal. This proposal is the foundation your semester project will be built on, so invest the time to make it sharp.

A strong proposal does four things well:

1. States a clear, specific business question
2. Explains why the answer matters to a real decision-maker
3. Shows that you know which data you need and how to get it
4. Describes specific analyses and visualizations, not vague gestures at exploring the data

Use the preliminary exploration section at the end to start poking at the data — early findings often sharpen a proposal from good to great.

**Submission instructions:**

- Save this notebook with your completed proposal
- Clear all outputs before submitting (Kernel → Restart & Clear Output)
- Submit through Canvas → Week 5 → Project Proposal (Group Submission)

---

## Section 1: Team

**Canvas Group Name:**

> e.g., Group 4

**Team Members:**

| Name | UC Email |
|------|----------|
| | |
| | |
| | |
| | |

---

## Section 2: Project Title and Business Question

**Project Title:**

> A short, descriptive title (e.g., *Promotional Sensitivity by Income Tier* or *Store-Level Shopper Profiling*).

**Primary Business Question:**

> State your central question in 1–2 sentences. It should be specific enough that you would know when you have answered it, and open enough that the data could surprise you.
>
> Example: *Do households that regularly redeem coupons spend more per trip overall, or do they simply pay less for the same basket? And does this pattern differ across income brackets?*

**Your question:**

*Write here.*

---

## Section 3: Problem Statement and Decision-Maker Value

Write 2–4 paragraphs covering:

- **The business context.** What is the retailer trying to understand or improve? Why does this question matter right now?
- **The decision-maker.** Who at the organization would act on your findings? (e.g., head of marketing, store operations director, category manager) What decision does your analysis enable?
- **The stakes.** What happens if this question goes unanswered — or if the wrong answer is assumed? What could the retailer do differently if your findings are correct?

*Write your problem statement here. Aim for 150–300 words.*

---

## Section 4: Data Plan

### Datasets Required

List the Complete Journey tables your analysis requires and explain why each one is needed.

| Dataset | Why it's needed |
|---------|-----------------|
| transactions | |
| | |
| | |

### Key Joins

Describe how you will connect the tables (join keys, join types, and what you gain from each join).

*Write here. Example: Join transactions to products on `product_id` (left join) to bring in department and product category. Then join to demographics on `household_id` to connect spending patterns to household characteristics.*

### Key Variables and Aggregations

List the columns and derived metrics central to your analysis. What are you measuring, and how will you calculate it?

| Variable | How it's derived | Why it matters |
|----------|-----------------|----------------|
| | | |
| | | |
| | | |

---

## Section 5: Proposed Analyses

Describe at least **4–5 specific analyses** you plan to run. For each, state the specific question it answers, what you will compute or compare, and what you expect to find — and what would surprise you.

These should build on each other: start with understanding the data structure and distributions, then move into group comparisons, segmentation, and relationships.

### Analysis 1

**Question it answers:**

*Write here.*

**What you'll compute:**

*Write here.*

**Expected finding / what would surprise you:**

*Write here.*

### Analysis 2

**Question it answers:**

*Write here.*

**What you'll compute:**

*Write here.*

**Expected finding / what would surprise you:**

*Write here.*

### Analysis 3

**Question it answers:**

*Write here.*

**What you'll compute:**

*Write here.*

**Expected finding / what would surprise you:**

*Write here.*

### Analysis 4

**Question it answers:**

*Write here.*

**What you'll compute:**

*Write here.*

**Expected finding / what would surprise you:**

*Write here.*

### Analysis 5 *(optional but encouraged)*

**Question it answers:**

*Write here.*

**What you'll compute:**

*Write here.*

**Expected finding / what would surprise you:**

*Write here.*

---

## Section 6: Anticipated Visualizations

Describe at least **3 visualizations** you plan to create. For each, explain what it will show, which library you'll use and why, and what insight it is designed to reveal.

Think about how the visualizations connect — ideally they build a visual narrative that supports the story you plan to tell.

### Visualization 1

**Chart type and what it shows:**

*Write here.*

**Library:**

*Write here.*

**Why this is the right choice for this insight:**

*Write here.*

### Visualization 2

**Chart type and what it shows:**

*Write here.*

**Library:**

*Write here.*

**Why this is the right choice for this insight:**

*Write here.*

### Visualization 3

**Chart type and what it shows:**

*Write here.*

**Library:**

*Write here.*

**Why this is the right choice for this insight:**

*Write here.*

---

## Section 7: Preliminary Exploration

Use the cells below to start digging into the data. This is not graded for polish — it is graded for effort and for what it reveals about your plan.

Good preliminary exploration often does one or more of the following:

- Verifies that the join you need actually works and produces the expected row count
- Checks that the key variable you plan to analyze has enough variation
- Produces a first rough visualization that either confirms your hypothesis or reframes it
- Reveals a data quality issue worth flagging (missing values, unexpected categories, extreme outliers)

Aim for at least a few cells of real analysis — not just loading the data.

```python
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from completejourney_py import get_data

cj_data = get_data()
transactions       = cj_data['transactions']
products           = cj_data['products']
demographics       = cj_data['demographics']
campaigns          = cj_data['campaigns']
coupons            = cj_data['coupons']
coupon_redemptions = cj_data['coupon_redemptions']
```

```python
# Your preliminary exploration here
```

```python
# Your code here
```

```python
# Your code here
```

```python
# Your code here
```

### What Did You Find?

In 3–5 sentences, summarize what your preliminary exploration revealed. Did it confirm your plan, surprise you, or change the direction of your proposal?

*Write here.*
