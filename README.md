# Codex learning workspace

This project adapts the teaching method from [amosblomqvist/learn](https://github.com/amosblomqvist/learn) to Codex, and also runs in Claude Code. Its skills, curriculum, lesson, and artifact conventions are harness-neutral; only skill discovery and model routing are adapter-specific, and both harnesses have a checked-in adapter. It keeps the personalized probe → plan → teach loop while removing Pi extensions, the Obsidian requirement, the tmux subagent runtime, and separate visual-rendering setup. The Codex skills, curriculum layer, and documentation are available under the [MIT License](LICENSE).

## Install

### Prerequisites

- Git
- One supported harness, signed in and able to open a local project:
  - the Codex desktop app or Codex CLI, with access to `gpt-5.6-sol` and `gpt-5.6-terra` for this repository's configured routing; or
  - Claude Code, with access to Opus and Sonnet
- A filesystem that supports symlinks (`.claude/skills` is a symlink into `.agents/skills`)

### Setup

```bash
git clone git@github.com:carterj-c/codex-learn.git
cd codex-learn
```

Open this folder as a local project in your harness, then start a new task or session.

The skills themselves live in one place, `.agents/skills/`. Codex reads that path natively. Claude Code reads `.claude/skills/`, which is a committed symlink to `.agents/skills/`, so both harnesses load the same files and a curriculum's generated `<subject>` entry skill appears in both without extra work.

After pulling a skill update, start a new task or session; restart the harness if a skill does not appear in the picker.

## Start a lesson

Open a task and say (`$teach` in Codex, `/teach` in Claude Code):

```text
Use the teach skill to help me learn <topic>. My intended outcome is <what I want to understand, decide, or build>.
```

The teacher checks the prerequisites that matter, proposes a small lesson map, waits for approval, then teaches one connection at a time with a short check. When an active curriculum requires verification, it prepares a small claim horizon and waits for its research packet before teaching those claims.

## Personalize the teacher

Edit [`teach/SKILL.md`](.agents/skills/teach/SKILL.md), beginning with **Customize This Skill First**, to change pace, depth, examples, feedback tone, or low-energy behavior. Leave the rest in place unless you deliberately want to change the learning method.

## Harness mapping

The skills name other skills and subagents in bare backticks, such as `teach` or `lesson-researcher`. Invoke them the way your harness expects:

| Concept | Codex | Claude Code |
| --- | --- | --- |
| Skill files | `.agents/skills/` (native) | `.claude/skills/` → symlink to `.agents/skills/` |
| Invoke a skill | `$teach` | `/teach`, or the Skill tool |
| Subagent definitions | `.codex/agents/*.toml` | `.claude/agents/*.md` |
| Start a subagent | named custom agent | Agent tool with `subagent_type` |
| Project config | `.codex/config.toml` | `.claude/settings.json` |
| Teacher model | `gpt-5.6-sol`, high reasoning | Opus |
| Subagent model | `gpt-5.6-terra`, medium reasoning | Sonnet |
| Researcher write protection | `sandbox_mode = "read-only"` | frontmatter `tools:` allowlist with no Write, Edit, or Bash |

The two adapters are kept in sync by hand. When you add or re-scope a subagent, change both `.codex/agents/` and `.claude/agents/`, then run the validator.

## What changed from the reference

- Pi's skill becomes a project-local skill, discovered by Codex and Claude Code from the same files.
- Everyday checks remain ordinary chat prompts. A curriculum can optionally permit an on-request local interactive exercise through `interactive-assessment`.
- Curriculum lessons become compact, retrievable records in [`lessons/`](lessons/), with a per-subject index and separate artifact directories.
- A researcher subagent produces compact, reusable claim-verification packets when the subject policy requires evidence.
- `lesson-visuals` produces inspected SVG/PNG or local HTML artifacts when a real visual is useful, then presents them through the available harness browser or viewer.

Run `bash tests/validate-learning-skills.sh` to verify the workspace contract after editing the skills.

## Create a curriculum

This is separate from teaching. Open a normal project task and say:

```text
Use the curriculum-designer skill to draft a curriculum for <subject>.
My intended outcome is <capability>.
My sources are in curricula/<subject>/sources/.
```

The designer is a dedicated mid-tier subagent launched by this explicit workflow, not a mode of the teacher. It does not invoke the teacher, probe the learner, or write active curriculum files until you approve a draft. It creates the subject's entry skill after approval, which routes future learning through `curriculum` and `teach`.

If the subject source folder already contains material, the designer catalogs and indexes new or changed sources before drafting. It asks whether to follow an outline, cover selected material, use sources as references, or design independently. The approved directive is recorded in `subject-curriculum.md`; cited sections are verified before the designer claims alignment.

After approval, the generic templates in [`curriculum-files.md`](.agents/skills/curriculum-designer/references/curriculum-files.md) become a new, subject-specific `curricula/<subject>/` directory. No example curriculum is installed in a fresh workspace.

## Optional: add or refresh sources later

Drop new course materials into `curricula/<subject>/sources/`, then say:

```text
Use the curriculum-sources skill to catalog and index the sources for <subject>.
```

This is optional during setup because the designer does it automatically when it finds uncataloged sources. Use it later without redesigning the curriculum. The resulting `sources/catalog.md` and compact `sources/index.md` help the designer, teacher, and researcher find relevant sections. They are locators only: open the original source for a curriculum decision or claim verification. Keep copyrighted, instructor-only, and personal material in a private repository.

## Model routing

The intent is the same in both harnesses: a strong learner-facing teacher, and cheaper mid-tier subagents for design, research, and indexing.

On Codex, `.codex/config.toml` uses `gpt-5.6-sol` with high reasoning for the teacher, defaults every spawned subagent to `gpt-5.6-terra` with medium reasoning, and pins the `curriculum-designer`, `lesson-researcher`, and `source-indexer` roles to that Terra/medium configuration.

On Claude Code, `.claude/settings.json` selects Opus for the main session and each agent in `.claude/agents/` sets `model: sonnet`.

These defaults apply when opening a new task or session in this project; an already-running one keeps its selected model.

## Components and ownership

- **Teacher — the main task, on the harness's high-reasoning model.** `teach` runs the probe → plan → teach loop. When a subject curriculum is active, `curriculum` supplies its local policy and evidence. The generated `<subject>` entry skill is a shortcut into that same teacher flow. `lesson-visuals` and `interactive-assessment` are optional teaching tools. `lesson-researcher` is the teacher's read-only mid-tier verifier.
- **Curriculum designer — mid-tier subagent, started only by `curriculum-designer`.** It builds or revises the roadmap without teaching. While setting up a subject, it owns source preparation: `curriculum-sources` catalogs material and `source-indexer` creates structural maps. After setup, `curriculum-sources` can also be invoked directly for maintenance.

You do not manually switch the main task from the teacher to a second model. Calling `curriculum-designer` explicitly keeps the design workflow separate: the normal task dispatches the dedicated designer and presents its draft, while the teacher remains idle.

The main teacher preserves the probe → short plan → learner approval → bite-sized teach/check loop. After approval, it resolves a verification gate for the next factual horizon: a packet must be `covered` before new factual content advances, while `missing`, `pending`, or `stale` coverage permits only learner checks and already-established context. One packet can support several turns; when the next node is predictable, the teacher creates a pending gate row and reuses the same researcher thread to refill in the background when the harness supports it, otherwise refills synchronously. The researcher remains read-only; the teacher saves each returned packet under a unique name and maintains a rebuildable index. It stops using out-of-scope coverage when your direction changes. Verification improves trust, but is not infallible.
