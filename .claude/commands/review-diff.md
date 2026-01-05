---
description: Review current git changes and propose improvements + a commit message
allowed-tools: Bash(git status:*), Bash(git diff:*), Bash(git branch:*), Bash(git log:*)
argument-hint: [optional-focus]
---

## Context
- Focus: $ARGUMENTS
- Branch: !`git branch --show-current`
- Status: !`git status`
- Diff: !`git diff`
- Recent commits: !`git log --oneline -10`

## Task
Review the diff for correctness, maintainability, performance, and security.

Return:
1) Summary
2) Must-fix issues
3) Should-fix suggestions
4) Test plan
5) Suggested commit message (single line)

Do not edit files or run additional commands.
