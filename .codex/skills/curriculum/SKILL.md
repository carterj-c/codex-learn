---
name: curriculum
description: Use when the user starts or continues a multi-session learning arc that needs an editable subject roadmap and persistent evidence of their progress.
---

# Curriculum overlay

Use a curriculum to scope the generic teacher to one long-running subject. A curriculum supplies context and records evidence; it does not replace `$teach` or its probe → plan → teach loop.

## Resolve curriculum context

When the user names a curriculum or uses a subject entry skill:

1. Read `curricula/<subject>/subject-curriculum.md` for the subject's objectives, probe modifiers, and progression rules.
2. Read `curricula/<subject>/progress.md` for demonstrated knowledge, current gaps, stale knowledge, and revisit flags.
3. Read `curricula/<subject>/curriculum-map.md` only when selecting a next unit or checking prerequisite paths.
4. Build a compact context packet for the current lesson: learner outcome, relevant dependency strand, existing evidence, subject-specific probe modifiers, and likely next nodes.

Do not load a subject curriculum for an unrelated one-off teaching request.

## Work with the generic teacher

Use the curriculum context to focus `$teach`'s normal probe:

- Start from recorded evidence, but recheck knowledge that is partial, stale, high-impact, or needed as a new prerequisite.
- Apply subject-specific assessment requirements from `subject-curriculum.md`.
- Do not treat an unverified baseline assumption as proof of mastery.
- Do not skip the generic teacher's foundation confirmation, error diagnosis, plan approval, or per-node checks.

## Maintain evidence, not impressions

Update `progress.md` only after observed evidence: a diagnostic response, a learner explanation, a completed applied task, or an explicit correction. For each material update, record the concept, status, evidence, date, and next action.

Use these statuses consistently:

- **secure** — repeatedly demonstrated in relevant contexts.
- **partial** — a useful model exists, but a specific gap remains.
- **stale** — previously understood but needs a short recheck before relying on it.
- **unassessed** — no usable evidence yet.
- **revisit** — progress can continue, but this concept needs scheduled reinforcement.

Keep the ledger compact. Put detailed explanations and diagrams in `lessons/<subject>/` files, linking them from the ledger when useful.

## Select the next unit

Choose the next unit from the curriculum map using the learner's goal, prerequisite state, and expected value for the target subject. The map is a dependency roadmap, not a mandatory order. When evidence changes the route, update the progress ledger and explain the decision.
