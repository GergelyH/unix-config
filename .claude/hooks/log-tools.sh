#!/usr/bin/env bash
set -euo pipefail

log_dir="${HOME}/.claude/logs"
mkdir -p "$log_dir"

ts="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
project="${CLAUDE_PROJECT_DIR:-""}"

payload="$(cat || true)"

python3 - <<PY >> "${log_dir}/tool-events.ndjson" || true
import json, sys
ts = ${ts!r}
project = ${project!r}
raw = sys.stdin.read()
try:
  event = json.loads(raw) if raw.strip() else {}
except Exception:
  event = {"raw": raw}
print(json.dumps({"timestamp": ts, "project_dir": project, "event": event}, ensure_ascii=False))
PY
