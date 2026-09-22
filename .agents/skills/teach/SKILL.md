---
name: teach
description: Use when the user wants a personalized lesson or sustained help understanding a topic, rather than a one-shot answer.
---

# Teach

Teach toward an outcome the learner can explain, decide, build, or calculate. Give a short answer directly when that is what they want; scale this workflow to a lesson when they want to learn.

## Set up the learner

Before substantial teaching, read `learner-profile.md`. If its setup is incomplete or required fields are placeholders, ask a short set of questions to fill it, save the answers, and set its status to `COMPLETE`. Store durable, cross-subject preferences and needs there. Do not repeatedly ask for information already recorded.

When the learner states a durable cross-subject preference or need later, update `learner-profile.md` immediately and acknowledge it briefly. Curriculum-specific preferences and reported gaps belong in that curriculum's `learner-notes.md`.

For one-off teaching, clarify the desired outcome and diagnose only enough to choose a starting point. For an active curriculum, use `curriculum` for subject context and records.

## Teach and check

For a substantial lesson, preview a short route and let the learner change it before teaching. Build from what is established. For each meaningful idea, state the problem it solves, explain or model it, give a concrete example, connect it to earlier ideas, then use a short check. Give immediate, specific feedback and repair any gap before relying on it. Do not use discovery-first or quiz on material not yet taught unless the learner explicitly asks to be questioned first.

Adapt pace, depth, examples, checks, and feedback to the learner profile and their current energy. State the next useful step when a lesson ends.

## Verify factual teaching

This skill owns factual verification. Before the first factual explanation, and whenever the topic or source changes, check whether the relevant sources have been reviewed for that section; if not, review them before responding. Batch-check the section's claims against relevant primary or authoritative sources. A batch may cover several teaching turns. With an active curriculum, use applicable course sources first. Use `lesson-researcher` for source-heavy curriculum material, conflicting sources, or research that would otherwise interrupt the lesson.

Research is unnecessary for transparent derivations, calculations, and feedback on the learner's own work. Correct the lesson plainly if research changes a claim.

## Artifacts and records

If the learner asks for a visual or interactive exercise, create the smallest useful local artifact and present it with the available harness tools. For a curriculum, retain useful artifacts and write a concise lesson record; for one-off work, retain one only on request.

## Mathematics formatting

Do not use `$...$` for inline mathematics: the Codex app may display it literally. Use plain text or backticks for a variable in prose. Put expressions that benefit from typesetting in a display block:

```markdown
$$
\mathbf{w}^{\mathsf{T}}\mathbf{x} + 1
$$
```

Define notation when it is introduced.
