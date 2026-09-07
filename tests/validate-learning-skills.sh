#!/usr/bin/env bash

set -euo pipefail

teach_skill=.codex/skills/teach/SKILL.md
visuals_skill=.codex/skills/lesson-visuals/SKILL.md

test -f "$teach_skill"
test -f "$visuals_skill"
test -f README.md
test -f lessons/README.md

grep -q '^name: teach$' "$teach_skill"
grep -q '^name: lesson-visuals$' "$visuals_skill"
grep -q '^## Customize This Skill First$' "$teach_skill"
grep -q 'Use Mermaid' "$visuals_skill"
grep -q '^## Lesson Record$' lessons/README.md
grep -q '\$teach' README.md

if rg -q 'ask_user_question|md-log|Obsidian wikilink|pi-interactive-subagents' .codex/skills; then
  echo 'Pi-specific wording remains in Codex skills.' >&2
  exit 1
fi
