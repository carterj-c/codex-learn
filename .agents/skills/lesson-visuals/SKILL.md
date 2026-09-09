---
name: lesson-visuals
description: Use when a lesson contains a relationship, flow, comparison, or spatial idea that the learner would understand materially better as a visual.
---

# Lesson visual artifacts

Create one minimal, correct visual artifact that carries information prose or a single equation cannot carry. A visual is optional: omit it when words are clearer. A table can present data, but it is not a substitute for a requested picture, diagram, or spatial explanation.

## Persist the artifact separately

For an active curriculum, save a reusable visual under:

```text
lessons/<subject>/artifacts/<yyyy-mm-dd>-<topic-slug>/
```

Link the file from the corresponding lesson record and `lessons/<subject>/index.md`. The lesson Markdown is the explanation and retrieval record; it should not be coerced into being the visual itself. For a one-off lesson, retain an artifact only when the learner asks for durable notes.

## Present the artifact through the harness

After saving and inspecting an artifact, use the current harness's available presentation capability; do not merely leave a filesystem link in the lesson record.

- For an SVG, PNG, or other static artifact, open the saved file in the harness's preview or file viewer when available.
- For local HTML, serve its artifact directory on localhost and open that URL through the harness's built-in browser or browser integration when available.
- In a CLI with a graphical local session but no browser integration, open the URL in the system default browser when permitted. In a headless or remote CLI, print a copyable localhost URL and artifact path, then ask the learner to open it or use a port-forwarded URL.
- Keep the lesson note available as the companion explanation when it helps, but make the rendered artifact the visible teaching surface.

## Choose the smallest fitting artifact

- Use a rendered SVG or PNG for a diagram, spatial relationship, geometric interpretation, coordinate system, vector, transformation, plot, or other visual layout.
- Use a self-contained local HTML/CSS/JavaScript page when controlled interaction materially improves understanding—for example adjusting a vector, inspecting a transformation, or stepping through an algorithm. Include no external dependencies and make the HTML usable from a local server in the harness's browser when available.
- A Mermaid source file is acceptable only when paired with its rendered SVG; do not use an inline Mermaid block as the durable visual.
- Use a table only when direct comparison is the actual teaching goal. Never produce a table merely because a rendered visual would take more work.
- Keep equations and derivations in the lesson Markdown when typeset notation is what the learner needs; do not call that a visual artifact.

## Brief and verify

Before creating a visual, state the single relationship it must show. Remove every element that is not essential to that relationship.

- Inspect the rendered artifact before presenting it. Fix illegible labels, missing arrows, false spatial claims, non-working interaction, and unnecessary decoration.
- Present the artifact through the available harness UI with one sentence of context, then link it from the lesson record. Do not repeat every label in prose.

## Limits

- Never use a visual as decoration or as a substitute for evidence.
- Never draw a complex system merely because the topic is complex; split the explanation into separate visuals when needed.
- If you cannot make a correct visual, use prose and say what the visual would have been intended to clarify; do not silently replace it with a table.
