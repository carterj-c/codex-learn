# Codex learning workspace

This project adapts the teaching method from [amosblomqvist/learn](https://github.com/amosblomqvist/learn) to Codex. It keeps the important part—the personalized probe → plan → teach loop—and removes the Pi extensions, Obsidian requirement, tmux subagent runtime, and separate visual-rendering setup.

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

The teacher will check the prerequisites that matter, propose a small lesson map, teach one connection at a time, and use research or a visual only when it earns its place.

## Personalize the teacher

Edit [`teach/SKILL.md`](.agents/skills/teach/SKILL.md) and start with **Customize This Skill First**. That section is the intended control panel for pace, depth, favorite examples, feedback tone, and low-energy behavior. Leave the remainder in place unless you deliberately want to change the learning method.

## What changed from the reference

- Pi's skill becomes a project-local Codex skill.
- Everyday checks remain ordinary chat prompts with immediate, explicit feedback. A curriculum can optionally permit an on-request local interactive exercise through `$interactive-assessment`.
- Curriculum lessons become compact, retrievable records in [`lessons/`](lessons/), with a per-subject index and separate artifact directories.
- A researcher subagent becomes focused Codex web research when accuracy needs evidence.
- `$lesson-visuals` produces inspected SVG/PNG or local HTML artifacts when a real visual is useful; tables remain comparisons, not visual fallbacks.

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

## Model routing

The project configuration uses `gpt-5.6-sol` with high reasoning for the learner-facing teacher, and defaults every spawned subagent to `gpt-5.6-terra` with medium reasoning. These defaults apply when opening a new Codex task in this project; an already-running task keeps its selected model.
