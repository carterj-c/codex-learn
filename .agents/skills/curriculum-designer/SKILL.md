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

## Design brief

Give the subagent the learner's subject, target capability, context, desired pace or time budget when known, constraints, and teaching preferences. Ask only for details that materially affect the scope. If the learner has no initial baseline, mark it as an assumption for the later teacher to verify rather than turning this turn into a diagnostic.

If `curricula/<subject>/sources/catalog.md` exists, give the subagent the catalog and only the entries relevant to the proposed curriculum. Treat course-provided sources as a scope constraint and record how they shape the draft. If there are no sources yet, identify the highest-value materials the learner could add through `$curriculum-sources`; do not invent course requirements.

## Draft first

Default to a reviewable design packet. It must include:

- the target capability, scope, and exclusions;
- prerequisites that the teacher must verify;
- a dependency-based unit map and why its order fits the goal;
- the evidence required to mark each important node as usable;
- proposed subject-specific probe modifiers and artifact or assessment policy;
- source coverage, conflicts, and any material still needing confirmation;
- assumptions, tradeoffs, and open choices for the learner.

Do not create an active curriculum, write a progress ledger, or begin teaching until the learner explicitly approves the draft.

## Apply an approved draft

On an explicit approval, use the same custom subagent to create or revise the curriculum files, a blank lesson index, and a `sources/README.md` plus blank `sources/catalog.md` when absent. Preserve observed evidence, existing lessons, artifacts, and source catalogs when revising. The generic teacher takes over only in a later teaching task when the learner invokes `$curriculum` or a subject entry skill.
