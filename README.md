# Codex learning workspace

This project adapts the teaching method from [amosblomqvist/learn](https://github.com/amosblomqvist/learn) to Codex. Its curriculum, lesson, and artifact conventions are harness-neutral; the checked-in skill discovery and model-routing adapters target Codex. It keeps the personalized probe → plan → teach loop while removing Pi extensions, the Obsidian requirement, the tmux subagent runtime, and separate visual-rendering setup. The Codex skills, curriculum layer, and documentation are available under the [MIT License](LICENSE).

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

Open a Codex task and say:

```text
Use $teach to help me learn <topic>. My intended outcome is <what I want to understand, decide, or build>.
```

The teacher checks the prerequisites that matter, proposes a small lesson map, waits for approval, then teaches one connection at a time with a short check. When an active curriculum requires verification, it prepares a small claim horizon and waits for its research packet before teaching those claims.

## Personalize the teacher

Edit [`teach/SKILL.md`](.agents/skills/teach/SKILL.md), beginning with **Customize This Skill First**, to change pace, depth, examples, feedback tone, or low-energy behavior. Leave the rest in place unless you deliberately want to change the learning method.

## What changed from the reference

- Pi's skill becomes a project-local Codex skill.
- Everyday checks remain ordinary chat prompts. A curriculum can optionally permit an on-request local interactive exercise through `$interactive-assessment`.
- Curriculum lessons become compact, retrievable records in [`lessons/`](lessons/), with a per-subject index and separate artifact directories.
- A researcher subagent produces compact, reusable claim-verification packets when the subject policy requires evidence.
- `$lesson-visuals` produces inspected SVG/PNG or local HTML artifacts when a real visual is useful, then presents them through the available harness browser or viewer.

Run `bash tests/validate-learning-skills.sh` to verify the workspace contract after editing the skills.

## Create a curriculum

This is separate from teaching. Open a normal project task and say:

```text
Use $curriculum-designer to draft a curriculum for <subject>.
My intended outcome is <capability>.
My sources are in curricula/<subject>/sources/.
```

The designer is a dedicated Terra/medium subagent launched by this explicit workflow, not a mode of the teacher. It does not invoke the teacher, probe the learner, or write active curriculum files until you approve a draft. It creates the subject's entry skill after approval, which routes future learning through `$curriculum` and `$teach`.

If the subject source folder already contains material, the designer catalogs and indexes new or changed sources before drafting. It asks whether to follow an outline, cover selected material, use sources as references, or design independently. The approved directive is recorded in `subject-curriculum.md`; cited sections are verified before the designer claims alignment.

After approval, the generic templates in [`curriculum-files.md`](.agents/skills/curriculum-designer/references/curriculum-files.md) become a new, subject-specific `curricula/<subject>/` directory. No example curriculum is installed in a fresh workspace.

## Optional: add or refresh sources later

Drop new course materials into `curricula/<subject>/sources/`, then say:

```text
Use $curriculum-sources to catalog and index the sources for <subject>.
```

This is optional during setup because the designer does it automatically when it finds uncataloged sources. Use it later without redesigning the curriculum. The resulting `sources/catalog.md` and compact `sources/index.md` help the designer, teacher, and researcher find relevant sections. They are locators only: open the original source for a curriculum decision or claim verification. Keep copyrighted, instructor-only, and personal material in a private repository.

## Model routing

The project configuration uses `gpt-5.6-sol` with high reasoning for the learner-facing teacher, defaults every spawned subagent to `gpt-5.6-terra` with medium reasoning, and pins the `curriculum-designer`, `lesson-researcher`, and `source-indexer` roles to that Terra/medium configuration. These defaults apply when opening a new Codex task in this project; an already-running task keeps its selected model.

## Components and ownership

- **Teacher — Sol/high main task.** `$teach` runs the probe → plan → teach loop. When a subject curriculum is active, `$curriculum` supplies its local policy and evidence. The generated `$<subject>` skill is a shortcut into that same teacher flow. `$lesson-visuals` and `$interactive-assessment` are optional teaching tools. `lesson-researcher` is the teacher's read-only Terra/medium verifier.
- **Curriculum designer — Terra/medium subagent, started only by `$curriculum-designer`.** It builds or revises the roadmap without teaching. While setting up a subject, it owns source preparation: `$curriculum-sources` catalogs material and `source-indexer` creates structural maps. After setup, `$curriculum-sources` can also be invoked directly for maintenance.

You do not manually switch the main task from the teacher to a second model. Calling `$curriculum-designer` explicitly keeps the design workflow separate: the normal task dispatches the dedicated designer and presents its draft, while the teacher remains idle.

The main teacher preserves the probe → short plan → learner approval → bite-sized teach/check loop. After approval, it resolves a verification gate for the next factual horizon: a packet must be `covered` before new factual content advances, while `missing`, `pending`, or `stale` coverage permits only learner checks and already-established context. One packet can support several turns; when the next node is predictable, the teacher creates a pending gate row and reuses the same researcher thread to refill in the background when the harness supports it, otherwise refills synchronously. The researcher remains read-only; the teacher saves each returned packet under a unique name and maintains a rebuildable index. It stops using out-of-scope coverage when your direction changes. Verification improves trust, but is not infallible.
