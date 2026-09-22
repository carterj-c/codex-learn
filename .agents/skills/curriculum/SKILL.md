---
name: curriculum
description: Use when the user starts or continues a multi-session learning arc that needs an editable subject roadmap and persistent progress evidence.
---

# Curriculum context and evidence

Use a curriculum to scope `teach` to one subject. It supplies subject rules, a route, and durable learner evidence; it does not prescribe a second teaching workflow or own factual verification.

## Load only what is needed

Read `curricula/<subject>/subject-curriculum.md`, `learner-notes.md`, and `progress.md`. Read relevant slices of source catalogs or indexes, prior lesson records, and `curriculum-map.md` only when they help with the present topic, source, or route. Do not load a curriculum for an unrelated one-off request or load a whole source library.

Use course materials first for course-specific terminology, notation, scope, and claims. `teach` decides how factual claims are verified.

## Find a starting point

On initial placement, only when the start point is unknown, ask roughly 6--10 short questions across the relevant dependency path. Use the answers to choose a useful starting point and store observed placement evidence in `progress.md`.

Do not run automatic per-unit entry gates. Treat a new course unit as untaught unless observed evidence says otherwise. When a prerequisite is necessary, use at most a quick prerequisite check or refresher; never quiz the learner on untaught content.

## Maintain learner context

Immediately record learner-stated subject preferences, reported struggles, off-map topics, and route requests in `curricula/<subject>/learner-notes.md`. These are self-reports, not mastery evidence. Record only observed answers, explanations, completed work, and corrections in `progress.md`, with the concept, status, evidence, date, and next action.

The learner may request a reordering of dependencies or a small update to the curriculum map, teaching modifiers, or progression during teaching. Make the change, explain its effect, and record the route decision. Require explicit confirmation before changing a major outcome, overall scope, or a safety or assessment-integrity constraint.

After a meaningful lesson, update one concise lesson record and its index with the outcome, durable model, observed corrections, and next frontier. Keep records useful for retrieval rather than transcripts.
