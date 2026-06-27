# BANA 7025: Data Wrangling with Python

A 7-week graduate course at the University of Cincinnati that teaches students to work with data in Python — from first import through wrangling, visualization, and reproducible workflows.

**Instructor:** Brad Boehmke  
**Format:** Quarto book + Reveal.js slides + Jupyter lab notebooks  
**Project dataset:** [Complete Journey](https://cunningjames.github.io/completejourney_py/) retail transaction data

---

## Course structure

| Module | Week | Topics |
|--------|------|--------|
| 1 | 1 | Introduction, Python foundations, Jupyter/Colab |
| 2 | 2 | DataFrames, importing data |
| 3 | 3 | Cleaning data |
| 4 | 4 | Data wrangling (filter, transform, aggregate) |
| 5 | 5 | Joining and reshaping data |
| 6 | 6 | Visualization and EDA |
| 7 | 7 | Functions, control flow, and intro modeling |

---

## Repository structure

```
uc-bana-7025/
├── _quarto.yml              # Quarto book configuration
├── requirements.txt         # Python dependencies
├── book/                    # Textbook chapters (.qmd)
├── slides/                  # Weekly Reveal.js slide decks (.qmd)
├── notebooks/
│   ├── examples/            # Example notebooks for each topic
│   ├── tuesday-your-turn/   # Tuesday in-class coding notebooks
│   └── project-checkpoints/ # Semester project checkpoint templates
├── labs/                    # Thursday lab assignments (.ipynb)
├── assignments/             # Homework, midterm, final project
├── project/                 # Semester project overview and data
├── tutor/                   # AI tutor configuration
├── instructor/              # Instructor-only materials (not indexed)
└── data/                    # Shared datasets
```

---

## Local development

**1. Install Python dependencies**

```bash
pip install -r requirements.txt
```

**2. Install Quarto**

Download from [quarto.org](https://quarto.org/docs/get-started/)

**3. Render the book**

```bash
quarto render
```

**4. Preview locally**

```bash
quarto preview
```

The site will open at `http://localhost:4200` (or similar).

**5. Run a notebook**

```bash
jupyter lab
```

---

## Content authoring

- **Textbook chapters:** Edit `.qmd` files in `book/`. Run `quarto preview` to see changes live.
- **Slides:** Edit `.qmd` files in `slides/`. Each file is a standalone Reveal.js deck.
- **Lab notebooks:** Edit `.ipynb` files in `labs/`. Clear outputs before committing.
- **Example notebooks:** Add to `notebooks/examples/` and update the tutor index.

---

## AI Tutor

The AI tutor is configured in `tutor/`. It is grounded in student-facing course content and guardrailed from instructor-only materials and answer keys.

To rebuild the content index after adding new materials:

```bash
python tutor/build_index.py
```

---

## Related courses

- [BANA 4080: Data Mining](https://github.com/bradleyboehmke/uc-bana-4080) — broader data mining curriculum
- [BANA 6043: Statistical Computing](https://github.com/bradleyboehmke/uc-bana-6043) — statistical computing foundations

---

## License

Content is licensed under [Creative Commons Attribution 4.0](LICENSE).
