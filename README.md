# Codex learning workspace

This project adapts the teaching method from [amosblomqvist/learn](https://github.com/amosblomqvist/learn) to Codex. Its curriculum, lesson, and artifact conventions are harness-neutral; the checked-in skill discovery and model-routing adapters target Codex. It keeps the important part—the personalized probe → plan → teach loop—and removes the Pi extensions, Obsidian requirement, tmux subagent runtime, and separate visual-rendering setup.

## Origin and license

This is a Codex-focused fork/adaptation of [amosblomqvist/learn](https://github.com/amosblomqvist/learn), which inspired the teaching workflow and learning philosophy. This repository's Codex skills, curriculum layer, and documentation are available under the [MIT License](LICENSE).

## Install

### Prerequisites

- Git
- The Codex desktop app or Codex CLI, signed in and able to open a local project
- Access to `gpt-5.6-sol` and `gpt-5.6-terra` if you want to use this repository's configured teacher and subagent routing

### Setup

```bash
git clone git@github.com:carterj-c/codex-learn.git
cd codex-learn
```

Open this folder as a local Codex project, then start a new task. Codex discovers the project skills in `.agents/skills/`; after pulling a skill update, start a new task or restart Codex if it does not appear in the skill picker.

## Start a lesson

Open a Codex task in this project and say:

```text
Use $teach to help me learn <topic>. My intended outcome is <what I want to understand, decide, or build>.
```

For example:

```text
Use $teach to help me learn how transformers perform attention. My intended outcome is to derive the attention calculation and understand why queries, keys, and values are separate.
```

The teacher will check the prerequisites that matter, propose a small lesson map, wait for your approval, then teach one connection at a time with a short check. When the curriculum requires verification, it prepares a small private claim horizon, waits for a research packet, and uses that packet across several small turns rather than making one oversized response.

## Personalize the teacher

Edit [`teach/SKILL.md`](.agents/skills/teach/SKILL.md) and start with **Customize This Skill First**. That section is the intended control panel for pace, depth, favorite examples, feedback tone, and low-energy behavior. Leave the remainder in place unless you deliberately want to change the learning method.

## What changed from the reference

- Pi's skill becomes a project-local Codex skill.
- Everyday checks remain ordinary chat prompts with immediate, explicit feedback. A curriculum can optionally permit an on-request local interactive exercise through `$interactive-assessment`.
- Curriculum lessons become compact, retrievable records in [`lessons/`](lessons/), with a per-subject index and separate artifact directories.
- A researcher subagent produces compact, reusable claim-verification packets when the subject policy requires evidence.
- `$lesson-visuals` produces inspected SVG/PNG or local HTML artifacts when a real visual is useful, then presents them through the available harness browser or viewer; tables remain comparisons, not visual fallbacks.

Run `bash tests/validate-learning-skills.sh` to verify the workspace contract after editing the skills.

## Long-running ML mathematics curriculum

For an adaptive learning arc that persists across Codex tasks, say:

```text
Use $ml-mathematics to continue my ML mathematics curriculum. My current goal is <goal>.
```

The subject policy, adaptive roadmap, and evidence ledger live in [`curricula/ml-mathematics/`](curricula/ml-mathematics/). Edit `subject-curriculum.md` to tune this field's teaching style; `progress.md` is updated only from demonstrated learning evidence. The generic `$teach` skill stays available for unrelated subjects.

To request an interactive ML mathematics drill, say:

```text
Use $interactive-assessment for a short exercise on matrix dimensions.
```

The ML mathematics curriculum enables that skill only on request. Other curricula stay chat-only unless their own `subject-curriculum.md` opts in with an `interactive_assessment` block.

Meaningful curriculum lessons are stored as compact records, not raw transcripts. Their rendered diagrams, images, and reusable local HTML live beside the relevant lesson under `lessons/<subject>/artifacts/`, where later lessons can retrieve them through the subject index.

## Design a new curriculum

To design a curriculum without starting a lesson, open a normal project task and say:

```text
Use $curriculum-designer to draft a curriculum for <subject>.
My intended outcome is <capability>.
Follow <source ID / course outline / selected chapters>.
```

This dispatches the dedicated `curriculum-designer` subagent on `gpt-5.6-terra` with medium reasoning. It returns a reviewable curriculum draft; it does not invoke the teacher, probe the learner, or write active curriculum files until you explicitly approve it.

When sources are present, the learner states directly whether the designer follows an outline, covers selected material, uses sources as references, or ignores them for the roadmap. The approved directive is recorded in `subject-curriculum.md`; the designer verifies cited sections before claiming curriculum alignment.

## Add course sources

Drop course materials into `curricula/<subject>/sources/`, then say:

```text
Use $curriculum-sources to catalog and index the sources for <subject>.
```

The resulting `sources/catalog.md` and compact `sources/index.md` help the curriculum designer, teacher, and Terra/medium `lesson-researcher` subagent find relevant source sections. They use the index only as a locator and open the original source for a curriculum decision or claim verification. Keep copyrighted, instructor-only, and personal material in your private curriculum repository.

## Model routing

The project configuration uses `gpt-5.6-sol` with high reasoning for the learner-facing teacher, defaults every spawned subagent to `gpt-5.6-terra` with medium reasoning, and pins the `curriculum-designer` and `lesson-researcher` roles to that same Terra/medium configuration. These defaults apply when opening a new Codex task in this project; an already-running task keeps its selected model.

## Learning components

| Component | Kind | Intended use | Invoke it with | Persistent location |
| --- | --- | --- | --- | --- |
| Teacher | Agent (Sol/high main task) | Probe, plan, teach, and check a learner's understanding | `Use $teach to help me learn <topic>.` | Meaningful curriculum lessons: `lessons/<subject>/` |
| Curriculum overlay | Skill | Loads a subject policy, evidence, sources, and route | `Use $curriculum with $teach for <subject>.` | `curricula/<subject>/` |
| Subject entry skill | Skill | Starts or continues a subject-specific arc | `Use $ml-mathematics to continue my ML mathematics curriculum.` | That subject's curriculum and lessons directories |
| Curriculum designer | Subagent (Terra/medium) | Drafts units, evidence rules, sources, and verification policy before teaching begins | `Use $curriculum-designer to draft a curriculum for <subject>.` | Approved curriculum files under `curricula/<subject>/` |
| Lesson researcher | Read-only subagent (Terra/medium) | Returns evidence for named claims; never teaches or edits learner files | Normally dispatched by `$teach`; manually: `Use the lesson-researcher to verify these claims for <subject>.` | Teacher saves packets under `curricula/<subject>/verification/` |
| Curriculum sources | Skill + Terra/medium indexer | Catalogs sources and maps their useful structure | `Use $curriculum-sources to catalog and index the sources for <subject>.` | `curricula/<subject>/sources/` |
| Lesson visuals | Skill | Creates a visual only when it materially clarifies the lesson | `Use $lesson-visuals for <relationship or process>.` | `lessons/<subject>/artifacts/` |
| Interactive assessment | Skill | Runs a local exercise only when the subject permits it | `Use $interactive-assessment for a short exercise on <topic>.` | Observed results in progress and lesson records |

The main teacher preserves the probe → short plan → learner approval → bite-sized teach/check loop. After approval, it verifies the next small factual horizon before teaching it. One packet can support several turns; when the next node is predictable, the teacher reuses the same researcher thread to refill in the background when the harness supports it, otherwise refills synchronously. The researcher remains read-only; the teacher saves each returned packet under a unique name and maintains a rebuildable index. It does not advance to new factual content until the packet arrives, and it stops using out-of-scope coverage when your direction changes. Verification improves trust, but is not infallible.
