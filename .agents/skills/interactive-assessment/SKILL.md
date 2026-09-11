---
name: interactive-assessment
description: Use when a learner explicitly requests an interactive local quiz or when their active curriculum permits an on-request interactive assessment. Do not use for ordinary conversational checks.
---

# Interactive assessment

Use a small local browser exercise only when interaction adds useful evidence beyond a short chat check. This is a supplement to `teach`, not a replacement for its probe, feedback, or repair loop.

## Permission and scope

When a curriculum is active, read its `interactive_assessment` block in `subject-curriculum.md`.

- `off`: stay in chat.
- `on-request`: proceed only after the learner asks for an interactive quiz, drill, or exercise.
- `auto`: use professional judgment, but say why the interface helps before launching it.

If no active curriculum grants permission, ask before creating a local quiz. Do not infer permission from a request for a normal practice question.

## Choose the smallest useful format

Prefer ordinary chat for a single explanation, proof, derivation, or open-ended diagnostic. Use a local page for a short set of interactions such as:

- multiple choice with immediate explanations;
- matching symbols, definitions, or dimensions;
- ordering a procedure or derivation;
- manipulating a simple visual model when the relationship is spatial.

Keep a first exercise to 3–8 questions. Avoid gamification, accounts, analytics, external services, and assessment theatre. A quiz result is evidence about a narrow skill, not a mastery verdict.

## Run a local exercise

1. State the targeted concept and the evidence the exercise can provide.
2. For an active curriculum, create one self-contained HTML/CSS/JavaScript file under `lessons/<subject>/artifacts/<yyyy-mm-dd>-<topic-slug>/`; otherwise use a temporary directory. Include clear instructions, keyboard-accessible controls, a submit/reset flow, immediate item-level feedback, and a compact final result summary.
3. Serve the exercise directory on localhost and open it through the harness's built-in browser or browser integration when available. Otherwise open it in the system browser when permitted, or give the learner a copyable URL for a local, headless, or remote CLI. Let the learner interact with it; do not answer items for them.
4. Read or ask the learner to paste the final summary. Give feedback in chat, including the reasoning behind any missed item.
5. Retain a curriculum exercise as a reusable artifact and link it from the lesson record; delete a temporary exercise when it is no longer needed unless the learner asks to retain it.

Use a title and page text that say the exercise is local. Do not present client-side answer keys as secure or use the result as a high-stakes evaluation.

## Record results carefully

For an active curriculum, update `progress.md` only after an observed response or the completed exercise summary. Record the target concept, result, date, misconception if identified, and next action. A perfect result on one short exercise normally establishes at most a useful floor; recheck important prerequisites in another context.

After the exercise, return to `teach` for targeted repair or the next dependency. Do not turn a lesson into repeated quizzes when an explanation would be more useful.
