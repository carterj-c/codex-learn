# Codex learning workspace

This project adapts the teaching method from [amosblomqvist/learn](https://github.com/amosblomqvist/learn) to Codex. It keeps the important part—the personalized probe → plan → teach loop—and removes the Pi extensions, Obsidian requirement, tmux subagent runtime, and separate visual-rendering setup.

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

Edit [`teach/SKILL.md`](.codex/skills/teach/SKILL.md) and start with **Customize This Skill First**. That section is the intended control panel for pace, depth, favorite examples, feedback tone, and low-energy behavior. Leave the remainder in place unless you deliberately want to change the learning method.

## What changed from the reference

- Pi's skill becomes a project-local Codex skill.
- Popup questions and quizzes become ordinary chat prompts with immediate, explicit feedback.
- The Markdown log becomes optional lesson files in [`lessons/`](lessons/).
- A researcher subagent becomes focused Codex web research when accuracy needs evidence.
- Mermaid/SVG maker agents and Obsidian embeds become `$lesson-visuals`, Mermaid, LaTeX, and Codex-rendered artifacts.

Run `bash tests/validate-learning-skills.sh` to verify the workspace contract after editing the skills.
