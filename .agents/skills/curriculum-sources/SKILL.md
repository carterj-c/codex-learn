---
name: curriculum-sources
description: Use when the learner wants to add, catalog, or organize course materials for an active or planned curriculum. Do not use to teach from a source or create a curriculum roadmap.
---

# Curriculum sources

Maintain a curriculum-local source library under `curricula/<subject>/sources/`. It lets the curriculum designer, teacher, and `$lesson-researcher` find relevant course material without loading an entire textbook or folder into every lesson.

## Add sources

The learner may place files directly in the subject's `sources/` folder, then say:

```text
Use $curriculum-sources to catalog the sources for <subject>.
```

Or describe a URL, book, lecture slide deck, handout, assignment, or rubric and ask to add it. Do not copy, move, upload, or download a source unless the learner explicitly requests that action.

Create `sources/catalog.md` if absent. Give every source a stable short ID and record its path or URL, type, authority, relevant units, restrictions, and a one-line note on what it should answer. Inspect only enough metadata or content to catalog it; do not summarize every source by default.

## Catalog template

```markdown
# <Subject> source catalog

| ID | Source | Type | Authority and scope | Relevant units | Location | Notes / restrictions |
| --- | --- | --- | --- | --- | --- | --- |
| course-text | <Title> | textbook | Course reference | Units 1–4 | `textbook.pdf` | Cite page numbers; do not reproduce long passages |
```

Use `course-provided` for instructor material, `primary` for original or official material, and `supplementary` for optional references. Course-provided sources guide course conventions; they do not eliminate the need to flag a material conflict or uncertainty.

## Privacy and retrieval

Keep copyrighted, instructor-only, or personal material in the learner's private curriculum repository. Do not add those files to a public upstream repository. The teacher and researcher read the catalog first, then only the entries needed for the current question.
