---
name: ml-mathematics
description: Use when the user wants to start or continue a long-running mathematics curriculum for machine learning, AI, statistics, optimization, or quantitative modeling.
---

# ML mathematics curriculum

Use this as the entry point for the persistent ML mathematics learning arc. It specializes the generic teacher; it does not create a separate teaching system.

## Load the curriculum

Use `$curriculum` with subject `ml-mathematics`, then apply `$teach` using the resulting context. Read these files in this order:

1. `curricula/ml-mathematics/subject-curriculum.md`
2. `curricula/ml-mathematics/progress.md`
3. `curricula/ml-mathematics/curriculum-map.md` when choosing or revising a unit

## Subject focus

For this curriculum, make the learner able to read, reason about, and use mathematical expressions encountered in ML. Give special attention to notation fluency, dimensional compatibility, geometric or statistical interpretation, and substantive links to ML—without introducing advanced ML merely for a superficial connection.

When an equation matters, decode each unfamiliar symbol: its name, operation, mathematical meaning, geometric or statistical meaning, and purpose. Reduce this scaffolding only after the learner repeatedly demonstrates comfort.

Favor intuition, visual/geometric interpretation, notation, formulation, example, and application when that order helps. Use hand calculation only when it reveals structure; avoid repetitive arithmetic.

Persist lesson-level detail under `lessons/ml-mathematics/` and update the evidence ledger according to `$curriculum`.
