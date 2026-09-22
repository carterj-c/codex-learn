# Codex learning workspace

This project adapts the teaching method from [amosblomqvist/learn](https://github.com/amosblomqvist/learn) to Codex, and also runs in Claude Code. Its skills, curriculum, lesson, and artifact conventions are harness-neutral; only skill discovery and model routing are adapter-specific, and both harnesses have a checked-in adapter. It keeps personalized, explanation-first teaching while removing Pi extensions, the Obsidian requirement, the tmux subagent runtime, and separate visual-rendering setup. The Codex skills, curriculum layer, and documentation are available under the [MIT License](LICENSE).

## Showcase Vid
https://github.com/user-attachments/assets/fec5ca1e-0472-4122-a102-38734fac95b7

## Install

### Prerequisites

- Git
- One supported harness, signed in and able to open a local project:
  - the Codex desktop app or Codex CLI, with access to `gpt-6-sol` and `gpt-6-luna` for this repository's configured routing; or
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

Before substantial teaching, the teacher completes the short learner setup in [`learner-profile.md`](learner-profile.md) if it is still blank. It then explains and models each new idea before checking understanding. For an active curriculum with an unknown starting point, it uses one 6–10 question placement pass; it does not repeat a prerequisite gate for every new unit.

## Personalize the teacher

Fill in [`learner-profile.md`](learner-profile.md) to set pace, explanation and example preferences, check style, feedback style, and accessibility or energy needs. If it is incomplete when a lesson begins, the teacher asks a short setup series and saves the answers. Later preferences are recorded when you state them, so you do not have to edit the teaching engine.

## Harness mapping

The skills name other skills and subagents in bare backticks, such as `teach` or `lesson-researcher`. Invoke them the way your harness expects:

| Concept | Codex | Claude Code |
| --- | --- | --- |
| Skill files | `.agents/skills/` (native) | `.claude/skills/` → symlink to `.agents/skills/` |
| Invoke a skill | `$teach` | `/teach`, or the Skill tool |
| Subagent definitions | `.codex/agents/*.toml` | `.claude/agents/*.md` |
| Start a subagent | named custom agent | Agent tool with `subagent_type` |
| Project config | `.codex/config.toml` | `.claude/settings.json` |
| Teacher model | `gpt-6-sol`, high reasoning | Opus |
| Subagent model | `gpt-6-luna`, medium reasoning | Sonnet |
| Researcher write protection | `sandbox_mode = "read-only"` | frontmatter `tools:` allowlist with no Write, Edit, or Bash |

The two adapters are kept in sync by hand. When you add or re-scope a subagent, change both `.codex/agents/` and `.claude/agents/`, then run the validator.

## What changed from the reference

- Pi's skill becomes a project-local skill, discovered by Codex and Claude Code from the same files.
- Everyday checks follow explanation and examples instead of asking the learner to discover untaught content.
- Curriculum lessons become compact, retrievable records in [`lessons/`](lessons/), with a per-subject index and separate artifact directories.
- `teach` owns verification and batches research for the next coherent factual section. The read-only researcher returns a compact source brief for source-heavy curriculum material; there are no packet files or verification gates.
- When requested, the teacher can create a small visual or interactive local artifact and present it through the available harness browser or viewer.

Run `bash tests/validate-learning-skills.sh` to verify the workspace contract after editing the skills.

## Create a curriculum

This is separate from teaching. Open a normal project task and say:

```text
Use the curriculum-designer skill to draft a curriculum for <subject>.
My intended outcome is <capability>.
My sources are in curricula/<subject>/sources/.
```

The designer is a dedicated mid-tier subagent launched by this explicit workflow, not a mode of the teacher. It does not teach or write active curriculum files until you approve a draft. It creates the subject's entry skill after approval, which routes future learning through `curriculum` and `teach`.

If the subject source folder already contains material, the designer catalogs and indexes new or changed sources before drafting. It asks whether to follow an outline, cover selected material, use sources as references, or design independently. The approved directive is recorded in `subject-curriculum.md`; cited sections are verified before the designer claims alignment.

After approval, the generic templates in [`curriculum-files.md`](.agents/skills/curriculum-designer/references/curriculum-files.md) become a new, subject-specific `curricula/<subject>/` directory. Each curriculum has separate learner notes for preferences, reported struggles, and route decisions; these self-reports remain distinct from observed progress evidence. No example curriculum is installed in a fresh workspace.

## Optional: add or refresh sources later

Drop new course materials into `curricula/<subject>/sources/`, then say:

```text
Use the curriculum-sources skill to catalog and index the sources for <subject>.
```

This is optional during setup because the designer does it automatically when it finds uncataloged sources. Use it later without redesigning the curriculum. The resulting `sources/catalog.md` and compact `sources/index.md` help the designer, teacher, and researcher find relevant sections. They are locators only: open the original source for a curriculum decision or claim verification. Keep copyrighted, instructor-only, and personal material in a private repository.

## Model routing

The intent is the same in both harnesses: a strong learner-facing teacher, and cheaper mid-tier subagents for design, research, and indexing.

On Codex, `.codex/config.toml` uses `gpt-6-sol` with high reasoning for the teacher, defaults every spawned subagent to `gpt-6-luna` with medium reasoning, and pins the `curriculum-designer`, `lesson-researcher`, and `source-indexer` roles to that Luna/medium configuration.

On Claude Code, `.claude/settings.json` selects Opus for the main session and each agent in `.claude/agents/` sets `model: sonnet`.

These defaults apply when opening a new task or session in this project; an already-running one keeps its selected model.

## Components and ownership

- **Teacher — the main task, on the harness's high-reasoning model.** `teach` owns explanation-first instruction and factual verification. It uses `lesson-researcher` for source-heavy curriculum material and creates requested local visuals or exercises directly.
- **Curriculum layer — persistent subject context.** `curriculum` supplies the current route, learner notes, source locators, and observed evidence. It may adapt an active route with the learner during teaching. Initial placement is used only when the starting point is unknown; new units do not automatically reopen a diagnostic gate.
- **Curriculum designer — mid-tier subagent, started only by `curriculum-designer`.** It creates the initial roadmap or handles a substantial redesign. During setup, `curriculum-sources` catalogs material and `source-indexer` creates structural maps. After setup, `curriculum-sources` can also be invoked directly for maintenance.

You do not manually switch the main task from the teacher to a second model. Calling `curriculum-designer` explicitly keeps initial design and major redesign separate. Ordinary preference changes, reported gaps, and route adjustments remain part of the active teaching task and are saved immediately.
