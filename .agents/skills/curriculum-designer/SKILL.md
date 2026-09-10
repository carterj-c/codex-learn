---
name: curriculum-designer
description: Use when the learner wants to create or substantially redesign a long-running subject curriculum before beginning lessons. Do not use for ordinary teaching, diagnostics, or selecting the next existing lesson.
---

# Curriculum designer

Run this workflow separately from the teacher. Start the custom `curriculum-designer` subagent; do not invoke `$teach`, `$curriculum`, or a subject teaching entry skill during the design turn.

## Invoke without teaching

The learner can open a normal project task and say:

```text
Use $curriculum-designer to draft a curriculum for <subject>.
My intended outcome is <capability>.
```

The project task only dispatches and presents the result. The dedicated `curriculum-designer` subagent uses Terra with medium reasoning. The main project model does not run a lesson, probe the learner, or need to be manually changed for this workflow.

## Learner request

Give the subagent the learner's subject, target capability, context, desired pace or time budget when known, constraints, and teaching preferences. Ask only for details that materially affect the scope. If the learner has no initial baseline, mark it as an assumption for the later teacher to verify rather than turning this turn into a diagnostic.

If `curricula/<subject>/sources/catalog.md` exists, give the subagent the catalog, `sources/index.md` when present, and only the source entries or maps relevant to the proposed curriculum. The learner decides the source role in their request; never infer it from the catalog or index. Use an index only to locate a likely section, then inspect the original source before claiming alignment.

Ask for a source decision before drafting when cataloged sources exist but the learner has not said whether to:

- follow a course outline;
- cover named chapters, lectures, or assignments;
- use named sources as references; or
- design independently of the sources.

When the learner names an outline or coverage range, verify the relevant source sections before claiming alignment. Use `lesson-researcher` for a compact source-alignment check when needed. If there are no sources yet, identify the highest-value materials the learner could add through `$curriculum-sources`; do not invent course requirements.

## Draft first

Default to a reviewable design packet. It must include:

- the target capability, scope, and exclusions;
- prerequisites that the teacher must verify;
- a dependency-based unit map and why its order fits the goal;
- the evidence required to mark each important node as usable;
- proposed subject-specific probe modifiers and artifact, assessment, and verification policy;
- a justified verification mode (`off`, `adaptive`, or `strict`) with required and exempt claim classes that balances factual trust against researcher latency;
- the learner's source directive and a coverage map with source IDs and sections;
- source coverage, conflicts, and any material still needing confirmation;
- assumptions, tradeoffs, and open choices for the learner.

Do not create an active curriculum, write a progress ledger, or begin teaching until the learner explicitly approves the draft.

## Apply an approved draft

On an explicit approval, use the same custom subagent to create or revise the curriculum files, record the approved source directive and verification policy in `subject-curriculum.md`, and create a blank lesson index plus `sources/README.md`, `sources/catalog.md`, `sources/index.md`, `verification/README.md`, and `verification/index.md` when absent. Preserve observed evidence, existing lessons, artifacts, source catalogs, source indexes, source directives, verification packets, and their index when revising. The generic teacher takes over only in a later teaching task when the learner invokes `$curriculum` or a subject entry skill.
