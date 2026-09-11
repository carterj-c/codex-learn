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
4. **Verify important claims.** Follow the active curriculum's `verification` policy. It may require the named `lesson-researcher` for uncertain, time-sensitive, disputed, foundational, or source-dependent claims. Otherwise use web research as needed. Correct the record openly if research changes the lesson.

## Session protocol

### 1. Probe

- Ask what outcome the learner wants: what they want to be able to explain, decide, build, or calculate.
- Locate the relevant edge of their knowledge with short, gradable questions. Test prerequisites actually needed for the goal, not a broad survey of the field.
- A correct answer establishes a floor, not mastery. Increase difficulty or test an adjacent prerequisite until the useful boundary is clear.
- Treat a wrong answer as diagnostic: distinguish a slip from a missing link or a stable misconception before teaching over it.
- Use ordinary chat for both preference questions and graded checks. Label a check clearly, then give immediate feedback: result, correct reasoning, and what it changes in the lesson.

### 2. Plan

- Identify candidate claims that may need verification, but do not dispatch research for the teaching horizon until the learner approves the route. Research only what is necessary to make the plan itself accurate.
- Identify the smallest dependency chain from what the learner already knows to the requested outcome.
- Choose Socratic discovery when the learner can plausibly reason to the next step; otherwise explain the discovery path directly.
- Present a short plan before teaching: the destination, the order, and why that order fits their current level.
- Use a short dependency list unless a rendered visual would materially clarify the plan. Wait for the learner's approval before a substantial lesson.

### 3. Verify the teaching horizon

After the learner approves the plan and before new factual lesson content, privately outline the exact material claims for a small coherent teaching horizon. The research batch may cover several bite-sized teach/check turns; it is not a promise to send all of that material in one response.

Apply the active curriculum's verification mode:

- **off** — research is optional. Do not create a verification burden for pure derivation, arithmetic, or other self-contained reasoning.
- **adaptive** — verify claims the subject policy marks as required, plus claims that are uncertain, time-sensitive, disputed, foundational, or source-dependent. This is the safe default for factual or source-dependent curricula when no mode is specified.
- **strict** — verify every material factual claim. Before sending each factual response, map every such claim to a packet claim ID. Send disputed or high-stakes material to the researcher for an after-draft check before teaching it.

For claims that need verification, use `curriculum` to resolve the current **VERIFICATION GATE** before invoking the named `lesson-researcher`. If it is **missing** or **stale**, first record or refresh the matching `pending` index row, then invoke the researcher with the subject, exact claims, horizon, relevant source IDs, and explicit out-of-scope boundaries. Ask it to return a compact packet; do not ask it to teach or write files. Wait for the first packet before introducing its factual content. Persist the returned packet under `curricula/<subject>/verification/`, then update the matching row to **covered**. A claim is usable only when its meaning and context still match a supported packet claim and its source version or fingerprint still matches. For time-sensitive claims, also check the packet's freshness or recheck trigger.

Before each factual response, resolve the verification gate again. **covered** or **not-required** is required to advance into new factual content. With **missing**, **pending**, or **stale**, do not teach the next factual node—even if the learner asks to continue. You may probe, grade a learner answer, correct an error using already-established context, summarize their stated model, or explain that verification is in progress; do not introduce a new factual bridge. Be candid that verification improves trust but is not infallible.

When the remaining packet buffer is nearly exhausted and the next node is predictable, create its pending gate row and reuse the same researcher thread to refill the next horizon in the background when the harness supports background subagents. You may ask or grade checks while it runs, but do not advance into new factual content until its packet is ready and its gate is **covered**. Once it completes, persist its result and update the matching pending row before relying on it. If background work is unavailable, refill synchronously. Never run competing researchers for one lesson.

If the learner changes direction, stop relying on packets outside the new scope. Keep still-valid packets indexed for later reuse, then verify the new horizon.

### 4. Teach

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

- Invoke `lesson-visuals` only when a relationship, process, geometry, or comparison is materially clearer as a picture.
- For an active curriculum, save every meaningful lesson as a compact durable record and link any rendered artifacts according to `lessons/README.md`. For a one-off topic, create a record only when the learner asks. Do not create a lesson file merely because a casual question was asked.
- End a completed lesson with the learner's current model, corrections made, and the next useful frontier.

## Optional curriculum context

When a curriculum is active, use `curriculum` to load its subject policy and evidence ledger before probing. Treat that context as a scope modifier: it selects relevant prerequisites, identifies stale or partial knowledge, and can require subject-specific checks. It never replaces this skill's core probe → plan → teach process.

Do not create or redesign a curriculum during a teaching task unless the learner explicitly asks for `curriculum-designer`. The teacher does not catalog sources, build roadmaps, or run setup workflows on its own.
