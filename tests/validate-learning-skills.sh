#!/usr/bin/env bash

set -euo pipefail

teach_skill=.agents/skills/teach/SKILL.md
visuals_skill=.agents/skills/lesson-visuals/SKILL.md
curriculum_skill=.agents/skills/curriculum/SKILL.md
ml_math_skill=.agents/skills/ml-mathematics/SKILL.md
interactive_assessment_skill=.agents/skills/interactive-assessment/SKILL.md

test -f "$teach_skill"
test -f "$visuals_skill"
test -f "$curriculum_skill"
test -f "$ml_math_skill"
test -f "$interactive_assessment_skill"
test -f .codex/config.toml
test -f README.md
test -f lessons/README.md
test -f curricula/ml-mathematics/subject-curriculum.md
test -f curricula/ml-mathematics/curriculum-map.md
test -f curricula/ml-mathematics/progress.md

grep -q '^name: teach$' "$teach_skill"
grep -q '^name: lesson-visuals$' "$visuals_skill"
grep -q '^name: curriculum$' "$curriculum_skill"
grep -q '^name: ml-mathematics$' "$ml_math_skill"
grep -q '^name: interactive-assessment$' "$interactive_assessment_skill"
grep -q '^## Customize This Skill First$' "$teach_skill"
grep -q 'Use Mermaid' "$visuals_skill"
grep -q '^## Lesson Record$' lessons/README.md
grep -q '\$teach' README.md
grep -q 'does not replace' curricula/ml-mathematics/subject-curriculum.md
grep -q 'Observed evidence' curricula/ml-mathematics/progress.md
grep -q 'When a curriculum is active' "$teach_skill"
grep -q 'Optional interactive assessments' "$curriculum_skill"
grep -q 'mode: on-request' curricula/ml-mathematics/subject-curriculum.md
grep -q 'local interactive exercise' "$interactive_assessment_skill"
grep -q 'Do not use `\$...\$`' "$teach_skill"
grep -q '^model = "gpt-5.6-sol"$' .codex/config.toml
grep -q '^model_reasoning_effort = "high"$' .codex/config.toml
grep -q '^default_subagent_model = "gpt-5.6-terra"$' .codex/config.toml
grep -q '^default_subagent_reasoning_effort = "medium"$' .codex/config.toml

if rg -q 'ask_user_question|md-log|Obsidian wikilink|pi-interactive-subagents' .agents/skills; then
  echo 'Pi-specific wording remains in Codex skills.' >&2
  exit 1
fi

if test -e .codex/skills; then
  echo 'Skills must live under .agents/skills, not .codex/skills.' >&2
  exit 1
fi
