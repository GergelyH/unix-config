# Global Claude Code preferences (user scope)

- Default workflow: explore → plan → implement → verify (tests / typecheck / lint) → summarize.
- Prefer small, reviewable diffs. Avoid drive-by refactors unless requested.
- If anything looks like credentials/secrets: stop and ask (don't print it, don't paste it).
- When running commands: start with read-only inspection (status/diff/log), then propose the next command.
- End with: what changed, how to test, and any risks/rollback notes.
