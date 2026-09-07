# Subject Curriculum Overlay Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add an opt-in, persistent curriculum overlay and an ML mathematics specialization while preserving generic teaching behavior.

**Architecture:** `curriculum` resolves static subject policy and learner evidence; `ml-mathematics` selects the ML mathematics files and applies its teaching constraints; `teach` uses the resolved context only to scope its existing loop.

**Tech Stack:** Markdown, Codex project-local skills, Mermaid/LaTeX/Markdown, POSIX shell validation.

**Spec:** `docs/superpowers/specs/2026-09-07-subject-curriculum-design.md`

## Global Constraints

- A curriculum scopes but does not replace generic probing.
- Progress changes require observed evidence.
- The roadmap is adaptive, not a forced sequence.
- Subject policy and progress must be easy for the learner to edit.

---

### Task 1: Extend the contract test

**Files:**
- Modify: `tests/validate-learning-skills.sh`

- [ ] **Step 1: Add expectations for curriculum and ML mathematics files**

```sh
test -f .codex/skills/curriculum/SKILL.md
test -f .codex/skills/ml-mathematics/SKILL.md
test -f curricula/ml-mathematics/subject-curriculum.md
grep -q 'does not replace' curricula/ml-mathematics/subject-curriculum.md
```

- [ ] **Step 2: Run the validator**

Run: `bash tests/validate-learning-skills.sh`

Expected: FAIL because the new skill and curriculum files do not exist.

### Task 2: Create the curriculum skill layer

**Files:**
- Create: `.codex/skills/curriculum/SKILL.md`
- Create: `.codex/skills/ml-mathematics/SKILL.md`
- Modify: `.codex/skills/teach/SKILL.md`

- [ ] **Step 1: Define curriculum context resolution and evidence rules**
- [ ] **Step 2: Define the ML mathematics entry point and its subject constraints**
- [ ] **Step 3: Add the optional curriculum hook to the generic teacher**
- [ ] **Step 4: Validate all skills with `quick_validate.py`**

### Task 3: Create the editable ML mathematics curriculum

**Files:**
- Create: `curricula/ml-mathematics/subject-curriculum.md`
- Create: `curricula/ml-mathematics/curriculum-map.md`
- Create: `curricula/ml-mathematics/progress.md`
- Modify: `README.md`

- [ ] **Step 1: Write the subject policy from the learner's supplied teaching style, excluding generic probe rules**
- [ ] **Step 2: Add an adaptive dependency roadmap and an empty, documented evidence ledger**
- [ ] **Step 3: Document the ML mathematics entry prompt**
- [ ] **Step 4: Run the validator, skill validation, and `git diff --check`**
