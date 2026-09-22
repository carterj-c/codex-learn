---
name: curriculum-designer
description: Use when the learner wants to create a long-running subject curriculum or substantially redesign its overall scope and structure. Ordinary learner-directed adjustments can happen during teaching.
---

# Curriculum designer

Run initial design and major redesign separately from teaching with the custom `curriculum-designer` subagent. Give it the learner's subject, target capability, context, time budget, constraints, and known preferences. Ask only for missing choices that materially change the curriculum. Leave placement to the later teacher.

Once a curriculum is active, the teacher may record preferences, add a newly discovered gap, reorder the route, or adjust teaching modifiers and progression during a lesson. Return here when the learner wants to reconsider the curriculum's overall outcome, scope, safety constraints, or structure.

## Prepare sources when present

Before designing, look under `curricula/<subject>/sources/`. If it contains uncataloged material, use `curriculum-sources` and `source-indexer` before drafting.

Read the catalog and only the relevant source maps. The learner decides whether sources define the course, set a coverage range, or merely provide references. Use indexes as locators and inspect original material before claiming alignment. If source roles are unclear, ask before drafting. Verify named outlines or coverage ranges with `lesson-researcher`. If no sources exist, do not invent course requirements.

## Draft and approval

Return a reviewable draft containing:

- the target capability, scope, and exclusions;
- prerequisite assumptions;
- a dependency-based unit map and why its order fits the goal;
- evidence that would make important nodes usable;
- subject-specific teaching and assessment modifiers;
- the learner's source directive and coverage map;
- safety or assessment constraints;
- source conflicts, unverified assumptions, and open choices.

Do not create an active curriculum or teach until the learner approves the draft. Verification procedure belongs to `teach`, not the subject curriculum; the curriculum identifies only its authoritative sources and subject-specific factual constraints.

## Apply an approved draft

On approval, create or revise the curriculum from [the generic file templates](references/curriculum-files.md). Create `subject-curriculum.md`, `curriculum-map.md`, `progress.md`, and `learner-notes.md`. Create lesson and source indexes when their first records or materials exist.

Create or revise `.agents/skills/<subject>/SKILL.md` as a short subject entry point. It routes through `curriculum` with the stable subject slug and then `teach`, points to the subject files, and contains only subject-specific focus or safety modifiers. Do not repeat generic teaching, context-loading, verification, visual, or assessment workflows.

Preserve learner notes, observed evidence, lessons, artifacts, source indexes, source directives, and unrelated entry-skill customizations when revising. Teaching begins later through the generated subject entry skill or an explicit combination of `curriculum` and `teach`.
