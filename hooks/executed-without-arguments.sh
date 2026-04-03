#!/usr/bin/env bash
set -euo pipefail
# Argus — interactive or prompt-driven
# Usage: argus                               → interactive Claude Code session
#        PROMPT="diagnose ~/.mercury" argus  → non-interactive, identity + prompt
#        echo "diagnose ~/.mercury" | argus  → non-interactive, stdin

IDENTITY="$HOME/.argus/memories/001-identity.md"

PROMPT="${PROMPT:-}"
if [ -z "$PROMPT" ] && [ ! -t 0 ]; then
  PROMPT="$(cat)"
fi

cd "$HOME/.argus"

if [ -n "$PROMPT" ]; then
  exec opencode run --model opencode/big-pickle "$(cat "$IDENTITY")

$PROMPT"
else
  exec claude . --model sonnet
fi
