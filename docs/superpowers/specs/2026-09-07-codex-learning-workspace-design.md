# Codex Learning Workspace Design

## Goal

Adapt the teaching approach from the reference Pi configuration into a project-local Codex workspace that teaches through a normal Codex task, preserves lessons as Markdown, and displays math and diagrams in Codex rather than requiring Obsidian or a separate subagent runtime.

## Decisions

- Keep the pedagogical loop: probe the learner's current understanding, propose a dependency-ordered lesson plan, then teach and check one concept at a time.
- Store the teacher behavior in `.codex/skills/teach/SKILL.md`, so a Codex task can load it for a learning request. The opening customization section is intentionally short and user-owned.
- Replace the Pi `quiz` extension with clearly labelled chat questions and a Markdown record of answer, correction, and next step. The model grades in the same task and must explain the result.
- Replace the Pi question-popup extension with ordinary chat questions. Preferences or direction questions are distinct from graded knowledge checks.
- Replace the Pi markdown-log extension with topic lesson files under `lessons/`.
- Replace the dedicated researcher agent with Codex web research only when facts are uncertain, time-sensitive, disputed, or foundational to the explanation.
- Replace Mermaid/SVG-maker subagents and the Obsidian renderer with a companion `lesson-visuals` skill. It uses Mermaid for structural diagrams, LaTeX for math, and Codex image generation only when a diagram cannot express a spatial or geometric idea.
- Do not create a standalone application, database, scheduler, UI extension, tmux session, or external service.

## Workspace Layout

```text
.codex/skills/
  teach/SKILL.md             # pedagogy and session protocol
  lesson-visuals/SKILL.md    # visual-selection and rendering protocol
lessons/
  README.md                  # naming and lesson-record format
README.md                    # how to start a lesson and customize teaching
tests/validate-learning-skills.sh
```

## Session Flow

1. The learner starts a Codex task with a learning goal.
2. `teach` asks about desired outcome and uses short graded checks to locate relevant knowledge boundaries.
3. It researches only claims that need verification, then proposes a small dependency map and waits for approval.
4. It teaches each node through a motivating explanation, an explicit link to established nodes, and a short check.
5. The task writes or updates the selected lesson record. Any durable visual is placed alongside the lesson and linked with a normal Markdown path.

## Guardrails

- The teacher must not bluff facts; state and resolve uncertainty before treating a claim as a foundation.
- A visual must carry a relationship, flow, geometry, or comparison that prose alone cannot carry. Decorative visuals are excluded.
- The skill must use Codex tool names and behavior, not Pi-specific extensions, tool calls, or Obsidian-only embeds.
- Lesson records are notes, not a database or a formal learner model.

## Verification

`tests/validate-learning-skills.sh` checks the skill names, Codex-native wording, customization section, lesson-record template, and the documented entry point. `quick_validate.py` validates each skill's required frontmatter and structure.
