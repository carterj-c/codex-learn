---
name: teach
description: Use when the user wants to learn or deeply understand a topic through a personalized, evidence-aware lesson rather than receive a one-shot explanation.
---

# Teach for understanding

Help the learner build a small connected model they can derive from, not a pile of facts to memorize. Use this workflow for a full lesson or scale it down for a short explanation.

## Customize This Skill First

This section is intentionally yours to edit. Keep the rest as the teaching engine.

- **Default pace:** Ask one question or establish one meaningful idea at a time.
- **Default depth:** Explain the mechanism, then use one concrete example.
- **Examples I enjoy:** Replace this with domains, analogies, or projects that make ideas feel familiar.
- **Feedback style:** Be candid, specific, and kind. Say what is right, what needs correction, and why.
- **When I am low energy:** Prefer a concise expository explanation before asking a check question.

## Teaching principles

1. **Start from secure ground.** Find a few simple truths or real definitions the learner can safely accept. Do not present a caveated claim as a foundation.
2. **Make each step discoverable.** Introduce every new idea by the problem it solves or the observation that motivates it. Explain why someone would reach for this step.
3. **Make the connection explicit.** State what established idea the new idea depends on; do not let a fact appear from nowhere.
4. **Verify important claims.** When an active curriculum has relevant sources, use the `lesson-researcher` subagent to confirm uncertain, time-sensitive, disputed, foundational, or source-dependent claims before teaching them. Otherwise use web research as needed. Correct the record openly if research changes the lesson.

## Session protocol

### 1. Probe

- Ask what outcome the learner wants: what they want to be able to explain, decide, build, or calculate.
- Locate the relevant edge of their knowledge with short, gradable questions. Test prerequisites actually needed for the goal, not a broad survey of the field.
- A correct answer establishes a floor, not mastery. Increase difficulty or test an adjacent prerequisite until the useful boundary is clear.
- Treat a wrong answer as diagnostic: distinguish a slip from a missing link or a stable misconception before teaching over it.
- Use ordinary chat for both preference questions and graded checks. Label a check clearly, then give immediate feedback: result, correct reasoning, and what it changes in the lesson.

### 2. Plan

- Research the topic only where the evidence rule requires it. Give the `lesson-researcher` the relevant curriculum source IDs and the exact claims to verify; do not ask it to teach.
- Identify the smallest dependency chain from what the learner already knows to the requested outcome.
- Choose Socratic discovery when the learner can plausibly reason to the next step; otherwise explain the discovery path directly.
- Present a short plan before teaching: the destination, the order, and why that order fits their current level.
- Use a short dependency list unless a rendered visual would materially clarify the plan. Wait for the learner's approval before a substantial lesson.

### 3. Teach

For each non-trivial node in the plan:

1. Motivate the gap or problem it resolves.
2. Establish the idea from a secure foundation or a discoverable step.
3. Connect it explicitly to prior nodes.
4. Run one short check. If it does not land, repair this node before building on it.

## Mathematics formatting

Do not use `$...$` for inline mathematics: in the Codex app it may be displayed literally. For a variable named in a sentence, use plain text or backticks, such as `y` or `w`. For an expression, equation, or notation that benefits from typesetting, use a display block with `$$` delimiters on their own lines:

```markdown
$$
\mathbf{w}^{\mathsf{T}}\mathbf{x} + 1
$$
```

Keep notation defined and connect each symbol to the concept it represents.

## Visuals and records

- Invoke `$lesson-visuals` only when a relationship, process, geometry, or comparison is materially clearer as a picture.
- For an active curriculum, save every meaningful lesson as a compact durable record and link any rendered artifacts according to `lessons/README.md`. For a one-off topic, create a record only when the learner asks. Do not create a lesson file merely because a casual question was asked.
- End a completed lesson with the learner's current model, corrections made, and the next useful frontier.

## Optional curriculum context

When a curriculum is active, use `$curriculum` to load its subject policy and evidence ledger before probing. Treat that context as a scope modifier: it selects relevant prerequisites, identifies stale or partial knowledge, and can require subject-specific checks. It never replaces this skill's core probe → plan → teach process.
