# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Architecture

This is a **dotfiles repository** managed using a bare Git repository approach. The Git directory is stored in `~/dotfiles/` while the work tree is the entire home directory (`~`).

### Key Concept: The `config` Alias

All Git operations use the `config` alias instead of `git`:
```bash
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
```

This allows version controlling dotfiles without making the entire home directory a Git repository.

### Work/Personal Separation

Two separate bare git repos manage personal vs work dotfiles:

| Repo | Git Dir | Alias | Remote |
|------|---------|-------|--------|
| Personal | `~/dotfiles/` | `config` | github-personal.com (personal key) |
| Work | `~/dotfiles-work/` | `config-work` | github.com (work key) |

**Personal repo tracks:** `.zshrc`, `CLAUDE.md`, settings templates
**Work repo tracks:** `.zshrc-work`, `CLAUDE-work.md`, work-specific skills

- The `.zshrc` conditionally sources `.zshrc-work` if it exists
- **Never commit work-related secrets to the personal repo**

## Common Commands

### Dotfiles Management
```bash
# Check status of tracked files
config status

# Add a new dotfile
config add <file>

# Commit changes
config commit -m "message"

# Push to remote
config push

# Pull from remote
config pull

# View tracked files
config ls-files

# View diff
config diff
```

### Important Notes
- The home directory has many untracked files - this is normal
- Only explicitly added files are tracked
- Use `.gitignore` in home directory to exclude sensitive files
- Before adding files, verify they don't contain secrets or work-specific content

## Development Environment

This setup is configured for:
- **Python**: pyenv for version management, poetry for dependencies (in-project virtualenvs)
- **Node.js**: Managed via Homebrew (node@20)
- **Docker**: Rancher Desktop
- **Cloud**: Google Cloud SDK
- **Claude Code**: AWS Bedrock configuration

## Claude Code Settings

- **`~/.claude/settings.template.json`**: Tracked in personal repo (copy to `settings.json` on new machines)
- **`~/.claude/settings.json`**: Actual config (gitignored, modified by `/model` command)
- **`~/.claude/CLAUDE-work.md`**: Work-specific instructions (tracked in work repo via `config-work`)
- **`~/.claude/skills/`**: Personal skills in personal repo, work skills (e.g., `jira/`) in work repo

Work-related Claude Code configuration (AWS Bedrock, Jira, Confluence) is documented in `~/.claude/CLAUDE-work.md`.

## When Adding New Dotfiles

1. Check if file contains sensitive information (API keys, tokens, work-specific paths)
2. If work-related (non-secret): add with `config-work add <file>` and commit to work repo
3. If personal/safe: add with `config add <file>` and commit to personal repo
4. If contains secrets: add to `.zshrc-work` (sourced but tracked without secrets) or keep untracked
5. Update `.gitignore` if creating new categories of excluded files
