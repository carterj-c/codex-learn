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
3. Read `curricula/<subject>/sources/catalog.md` when it exists to locate only the course materials relevant to the current topic.
4. Read `curricula/<subject>/verification/index.md` when it exists to locate candidate packets for the current claims. Treat it as a convenience cache and scan packet filenames if it is absent, stale, or conflicted; open only likely matches.
5. Read `lessons/<subject>/index.md` when it exists to locate relevant earlier explanations and artifacts. Do not load every lesson note.
6. Read `curricula/<subject>/curriculum-map.md` only when selecting a next unit or checking prerequisite paths.
7. Build a compact context packet for the current lesson: learner outcome, relevant dependency strand, existing evidence, relevant source IDs, reusable verification coverage, subject-specific probe modifiers, and likely next nodes.

Do not load a subject curriculum for an unrelated one-off teaching request.

## Use curriculum sources selectively

Course materials in `curricula/<subject>/sources/` are a retrieval library, not context to load wholesale. Read the catalog first, then only the sections or files needed for the present claim. Give course-provided sources priority for course-specific terminology, notation, and scope. If a source conflicts with another reliable source or appears uncertain, invoke the `lesson-researcher` subagent to report the conflict before teaching it as fact.

## Verification packets

Read the optional `verification` block in `subject-curriculum.md` before planning factual lesson content. Its mode is `off`, `adaptive`, or `strict`; if absent, use **adaptive** for factual or source-dependent curricula and do not force research for pure derivations or arithmetic. Apply its required and exempt claim classes through `$teach`.

The main teacher, not the researcher, stores compact, durable research packets under `curricula/<subject>/verification/`, not in learner progress or lesson records. Use a unique filename containing a UTC timestamp and stable horizon ID so repeated or concurrent work cannot overwrite another packet. Treat `index.md` as a rebuildable retrieval cache: re-read and merge it after saving a packet, preserve existing rows, and scan the packet files if the index is absent, stale, or conflicted. Each packet must include:

- its subject, scope, teaching horizon, date, and explicit out-of-scope boundaries;
- exact claims with stable IDs, support status, and safe teaching formulation;
- source ID plus page, section, or URL; source identity, fingerprint or version; and verification date;
- uncertainty, conflicts, and an expiry or recheck trigger for volatile claims.

Reuse a packet only when the claim's meaning and context, and its source version or fingerprint, still match. Check freshness for time-sensitive claims. Keep packets compact and indexed so a later lesson can find still-valid coverage without treating stale or out-of-scope evidence as support.

## Work with the generic teacher

Use the curriculum context to focus `$teach`'s normal probe:

- Start from recorded evidence, but recheck knowledge that is partial, stale, high-impact, or needed as a new prerequisite.
- Apply subject-specific assessment requirements from `subject-curriculum.md`.
- Do not treat an unverified baseline assumption as proof of mastery.
- Do not skip the generic teacher's foundation confirmation, error diagnosis, plan approval, or per-node checks.

## Optional interactive assessments

The active subject may include an `interactive_assessment` block in `subject-curriculum.md`. Treat it as a subject-scoped permission, not as a replacement for chat-based probing.

- With `mode: off`, use ordinary chat checks only.
- With `mode: on-request`, use `$interactive-assessment` only after the learner explicitly asks for an interactive quiz, drill, or exercise.
- With `mode: auto`, the teacher may propose a local exercise when interaction would provide better evidence than a short chat check.

If the block is absent, behave as `off`. Record completed exercise evidence using the same standards as any other observed assessment.

## Maintain evidence, not impressions

Update `progress.md` only after observed evidence: a diagnostic response, a learner explanation, a completed applied task, or an explicit correction. For each material update, record the concept, status, evidence, date, and next action.

Use these statuses consistently:

- **secure** — repeatedly demonstrated in relevant contexts.
- **partial** — a useful model exists, but a specific gap remains.
- **stale** — previously understood but needs a short recheck before relying on it.
- **unassessed** — no usable evidence yet.
- **revisit** — progress can continue, but this concept needs scheduled reinforcement.

Keep the ledger compact. After a meaningful curriculum lesson, create or update one concise record at `lessons/<subject>/<yyyy-mm-dd>-<topic>.md` and add it to `lessons/<subject>/index.md`. Record the outcome, durable explanation, corrections, and next frontier—not a raw chat transcript. Store rendered diagrams, images, and reusable local HTML under `lessons/<subject>/artifacts/<yyyy-mm-dd>-<topic-slug>/`, and link them from the lesson record and index when useful.

## Select the next unit

Choose the next unit from the curriculum map using the learner's goal, prerequisite state, and expected value for the target subject. The map is a dependency roadmap, not a mandatory order. When evidence changes the route, update the progress ledger and explain the decision.
