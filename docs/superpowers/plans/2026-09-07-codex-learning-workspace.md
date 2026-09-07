# Codex Learning Workspace Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a project-local Codex learning workspace that retains the reference teaching approach without Pi, Obsidian, or a separate rendering/subagent stack.

**Architecture:** Two Codex skills separate pedagogy from presentation: `teach` owns lesson flow and evidence, while `lesson-visuals` selects an appropriate Codex-native visual form. Markdown lesson files retain durable progress and the README provides the entry point.

**Tech Stack:** Markdown, Codex project-local skills, Mermaid/LaTeX/Markdown, POSIX shell validation.

**Spec:** `docs/superpowers/specs/2026-09-07-codex-learning-workspace-design.md`

## Global Constraints

- All reusable instructions live in `.codex/skills/`.
- No Pi extensions, Obsidian dependency, tmux runtime, or external service.
- The user must be able to personalize teaching behavior without editing the rest of the skill.
- A visual is included only when it materially improves understanding.

---

### Task 1: Define the expected workspace contract

**Files:**
- Create: `tests/validate-learning-skills.sh`

**Interfaces:**
- Produces: a zero-exit validation command for the skill package and lesson workspace.

- [ ] **Step 1: Write the failing validation script**

```sh
test -f .codex/skills/teach/SKILL.md
test -f .codex/skills/lesson-visuals/SKILL.md
grep -q '^## Customize This Skill First$' .codex/skills/teach/SKILL.md
```

- [ ] **Step 2: Run the script to verify it fails**

Run: `bash tests/validate-learning-skills.sh`

Expected: FAIL because the project-local skill files do not exist.

- [ ] **Step 3: Expand the script to check the documented Codex-native contract**

```sh
! rg -q 'ask_user_question|md-log|Obsidian wikilink|pi-interactive-subagents' .codex/skills
grep -q 'Use Mermaid' .codex/skills/lesson-visuals/SKILL.md
grep -q '## Lesson Record' lessons/README.md
```

- [ ] **Step 4: Re-run the validator after the workspace is implemented**

Run: `bash tests/validate-learning-skills.sh`

Expected: PASS.

### Task 2: Create Codex-native teaching and visual skills

**Files:**
- Create: `.codex/skills/teach/SKILL.md`
- Create: `.codex/skills/lesson-visuals/SKILL.md`

**Interfaces:**
- Consumes: a learner's topic, outcome, and prior knowledge.
- Produces: a proposed dependency map, lesson explanation, graded checks, and a record-ready lesson summary.

- [ ] **Step 1: Create the teaching skill with a dedicated customization section**

```markdown
## Customize This Skill First

Edit only this section to set your preferred lesson pace, examples, depth, and feedback style.
```

- [ ] **Step 2: Add the probe → plan → teach workflow and evidence rule**

```markdown
Before treating a fact as foundational, verify it when it is uncertain, time-sensitive, or disputed.
```

- [ ] **Step 3: Create the visual skill with format routing**

```markdown
Use Mermaid for labeled relationships. Use LaTeX for mathematical notation. Use image generation only for spatial or geometric visuals Mermaid cannot express.
```

- [ ] **Step 4: Run skill validation**

Run: `python3 /home/ptable/.codex/skills/.system/skill-creator/scripts/quick_validate.py .codex/skills/teach && python3 /home/ptable/.codex/skills/.system/skill-creator/scripts/quick_validate.py .codex/skills/lesson-visuals`

Expected: PASS for both skills.

### Task 3: Add the learner-facing workspace and verify it

**Files:**
- Create: `README.md`
- Create: `lessons/README.md`
- Modify: `.gitignore`

**Interfaces:**
- Consumes: the `teach` and `lesson-visuals` skill names.
- Produces: a repeatable start prompt and a durable lesson-record template.

- [ ] **Step 1: Document how to begin a learning task**

```markdown
Use `$teach` to help me learn <topic>. My intended outcome is <outcome>.
```

- [ ] **Step 2: Add the lesson-record template**

```markdown
## What I now understand
## Checks and corrections
## Next frontier
```

- [ ] **Step 3: Ignore the local brainstorming companion state**

```gitignore
.superpowers/
```

- [ ] **Step 4: Run all checks**

Run: `bash tests/validate-learning-skills.sh && git diff --check`

Expected: PASS with no whitespace errors.
