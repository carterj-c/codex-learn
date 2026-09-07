# Subject Curriculum Overlay Design

## Goal

Add persistent, editable curriculum layers to the Codex learning workspace without altering the generic teacher's pedagogy. The first layer supports mathematics for machine learning.

## Architecture

`teach` remains responsible for the generic probe → plan → teach loop. A new `curriculum` skill loads the selected subject's static policy and current evidence, then supplies a context packet to `teach`. A subject entry skill, such as `ml-mathematics`, selects the curriculum and provides subject-specific constraints.

```text
$ml-mathematics
  → $curriculum
      → curricula/ml-mathematics/subject-curriculum.md
      → curricula/ml-mathematics/progress.md
      → curricula/ml-mathematics/curriculum-map.md
  → $teach
```

## Boundaries

- The curriculum overlay scopes probing; it never replaces the generic teacher's probing method.
- `subject-curriculum.md` is static, human-authored policy: objectives, relevant strands, subject-specific probe modifiers, applications, and progression rules.
- `progress.md` is the editable, evidence-based learner state. It must be compact and distinguish secure, partial, stale, unassessed, and revisit states.
- `curriculum-map.md` is an adaptive dependency roadmap, not a fixed syllabus. Its ordering can change when evidence reveals a more appropriate route.
- A curriculum lesson should update progress only after actual demonstrated evidence, not the teacher's assumption.
- The ML mathematics subject layer owns notation fluency, dimensional reasoning, geometric interpretation, and substantive ML connections. Generic teaching rules remain in `teach`.

## ML Mathematics Scope

Starting assumptions are single-variable calculus, basic probability/statistics, basic linear algebra, and rusty multivariable calculus; each must still be probed when it becomes relevant. The initial roadmap covers notation fluency, linear algebra and geometry, multivariable calculus, probability/statistics, optimization, and integrated ML applications.

## Verification

The workspace validator checks the new skills, curriculum documents, curriculum hook, and absence of Pi-specific instructions. Codex skill validation runs against each new skill.
