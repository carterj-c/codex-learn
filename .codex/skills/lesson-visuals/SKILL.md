---
name: lesson-visuals
description: Use when a lesson contains a relationship, flow, comparison, or spatial idea that the learner would understand materially better as a visual.
---

# Lesson visuals

Create one minimal, correct visual that carries information prose or a single equation cannot carry. A visual is optional: omit it when words are clearer.

## Choose the smallest fitting format

- Use Mermaid for dependencies, flows, sequences, state changes, trees, and component relationships. Keep labels short and use no more nodes than the idea needs.
- Use LaTeX for mathematical notation and derivations. A diagram does not replace a clear equation when the relationship is algebraic.
- Use a simple table when a direct comparison is the point.
- Use Codex image generation or a rendered SVG only for a spatial or geometric relationship that Mermaid cannot express faithfully, such as coordinates, vectors, shape, physical layout, or a plot.

## Brief and verify

Before creating a visual, state the single relationship it must show. Remove every element that is not essential to that relationship.

- For a Mermaid diagram, write a fenced `mermaid` block directly in the lesson. Read its edges and labels for factual direction before sending it.
- For a rendered visual, inspect the produced artifact before presenting it. Fix illegible labels, missing arrows, false spatial claims, and unnecessary decoration.
- Present the visual next to the teaching step it supports. Give it one sentence of context; do not repeat every label in prose.

## Limits

- Never use a visual as decoration or as a substitute for evidence.
- Never draw a complex system merely because the topic is complex; split the explanation into separate visuals when needed.
- If you cannot make a correct visual, use prose and say what the visual would have been intended to clarify.
