#!/usr/bin/env bash
set -euo pipefail

project_dir="${CLAUDE_PROJECT_DIR:-$(pwd)}"
cd "$project_dir"

query="$(
python3 - <<'PY' || true
import json, sys
try:
  data = json.load(sys.stdin)
  print((data.get("query") or "").strip())
except Exception:
  print("")
PY
)"

if [[ -z "$query" ]]; then
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    git ls-files | head -15
  fi
  exit 0
fi

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  git ls-files | grep -iF -- "$query" | head -15
  exit 0
fi

if command -v fd >/dev/null 2>&1; then
  fd --type f --hidden --follow --exclude .git -- "$query" . | head -15
  exit 0
fi

find . -type f -not -path '*/.git/*' -print | grep -iF -- "$query" | head -15
