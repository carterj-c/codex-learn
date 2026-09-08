# ML mathematics subject curriculum

## Purpose

Build the mathematical fluency needed to understand and work with mathematics in machine learning, deep learning, statistics, optimization, quantitative modeling, technical textbooks, and eventually research papers.

The target capability is to look at an unfamiliar ML expression and systematically determine what every symbol means, which dimensions are compatible, what operation occurs, what the expression does, its geometric or statistical interpretation, and why it is useful.

## Relationship to the generic teacher

This curriculum does not replace the generic teacher's probing system. It scopes that system to ML mathematics, using recorded evidence and the requirements below. The generic teacher still establishes foundations, diagnoses mistakes, proposes the teaching plan, and verifies each important node.

## Starting context to verify when relevant

The learner reports good working knowledge of single-variable calculus, basic probability and statistics, and basic linear algebra (vectors, matrices, linear systems, row reduction). They have encountered multivariable calculus but may be rusty, and their formal notation recall may be uneven.

Treat these as routing hints, not mastery claims. Probe only the parts needed for the present dependency path.

## Curriculum-specific probe modifiers

When probing a relevant topic, include a useful mix of:

- interpretation of notation and equations;
- dimensional or shape reasoning for vectors, matrices, and operations;
- geometric or statistical interpretation where relevant;
- a small calculation only when it reveals structure;
- an ML, statistics, or optimization use case once prerequisites make it meaningful.

Classify an error as conceptual misunderstanding, notation confusion, algebra error, arithmetic slip, or forgetfulness. Use that classification to decide whether to repair, re-probe, or flag the concept for later.

## Teaching priorities

1. Conceptual understanding and intuition.
2. Geometric or statistical meaning.
3. Notation fluency and equation reading.
4. Operations, dimensions, and transformations of information.
5. Connections among concepts.
6. Substantive ML/statistics applications.

For an important new symbol or expression, explain its spoken name, operation, mathematical meaning, intuitive interpretation, and reason for use. Ask the learner to translate selected equations into ordinary language once enough context is established.

Use visuals when they materially improve a vector, transformation, surface, gradient, distribution, optimization, or decision-boundary explanation. Use `$lesson-visuals`; avoid decoration.

## Optional interactive assessments

This curriculum permits local interactive assessments only when the learner asks for one. It does not make them the default probe or lesson format.

```yaml
interactive_assessment:
  mode: on-request
  allowed_formats:
    - multiple-choice
    - matching
    - ordering
    - visual
  max_questions: 8
  save_results: evidence-only
```

Use these exercises when interaction reveals something a normal chat answer would not, such as matching matrix shapes to operations, ordering a derivation, or manipulating a geometric relationship. Keep proofs, equation-reading explanations, and open-ended diagnostic responses in chat.

## Progression rules

- Move forward when the next dependency is usable, not only at perfect mastery.
- Mark partial, stale, or high-value gaps for revisit in `progress.md` rather than derailing the whole arc.
- Prefer the map's dependency structure over its display order when the learner's goal changes.
- At the end of a meaningful unit, include a brief mixed review of understanding, notation, reasoning, and application.
- Add an ML connection only when it clarifies the current mathematics; do not jump ahead into advanced material for name recognition.
