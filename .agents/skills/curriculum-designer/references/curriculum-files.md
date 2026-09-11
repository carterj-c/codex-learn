# Generic curriculum file templates

Use these as concise starting shapes after a learner approves a curriculum draft. Replace every placeholder with the approved subject-specific content; do not create an example curriculum in the repository.

## `curricula/<subject>/subject-curriculum.md`

```markdown
# <Subject> curriculum

## Outcome and scope

## Probe modifiers

## Progression and evidence rules

## Source directive

## Verification

mode: adaptive
required_claim_classes: []
exempt_claim_classes: []

## Optional interactive assessment

mode: off
```

## `curricula/<subject>/curriculum-map.md`

```markdown
# <Subject> curriculum map

| Unit | Depends on | Learner outcome | Evidence of use |
| --- | --- | --- | --- |
```

## `curricula/<subject>/progress.md`

```markdown
# <Subject> progress

| Concept | Status | Observed evidence | Date | Next action |
| --- | --- | --- | --- | --- |
```

## `curricula/<subject>/verification/index.md`

```markdown
# <Subject> verification index

| Horizon | Status | Updated | Packet | Claim IDs | Sources / recheck trigger |
| --- | --- | --- | --- | --- | --- |
```

Use `pending`, `covered`, `stale`, or `superseded` for status. A pending row is a durable reminder that factual teaching cannot advance for that horizon until a matching packet is saved. Do not add source rows, verification packets, lesson records, or learner evidence until they exist.

## Other indexes

Create the headings and empty tables described by `curriculum-sources` and `lessons/README.md`.
