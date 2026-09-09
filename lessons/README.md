# Lesson records and artifacts

For a curriculum, create one Markdown file per meaningful lesson at `lessons/<subject>/<yyyy-mm-dd>-<topic-slug>.md`. Keep `lessons/<subject>/index.md` as the retrieval map. A lesson note is a compact record of understanding, not a transcript.

Put rendered visuals, images, and reusable local HTML in `lessons/<subject>/artifacts/<yyyy-mm-dd>-<topic-slug>/`. Link them from the lesson and index; do not force the note itself to be a diagram, a table, or an embedded visual.

## Subject index

```markdown
# <Subject> lesson index

| Date | Lesson | Outcome | Evidence / next frontier | Artifacts |
| --- | --- | --- | --- | --- |
| 2026-09-09 | [Matrix-vector products](2026-09-09-matrix-vector-products.md) | Infer output shapes | Recheck transpose notation | [diagram](artifacts/2026-09-09-matrix-vector-products/shapes.svg) |
```

## Lesson Record

```markdown
# <Topic>

## Intended outcome

<What I wanted to be able to explain, decide, or do.>

## Foundations established

- <Secure fact or definition>

## What I now understand

- <A connected explanation in my own words.>

## Checks and corrections

- <Question, my answer, and the correction or confirmation.>

## Next frontier

- <The next concept that follows naturally from this one.>

## Related artifacts

- [<Diagram or local HTML>](artifacts/<yyyy-mm-dd>-<topic-slug>/<filename>) — <what it clarifies>

## Sources

- <Sources used to verify key claims.>
```
