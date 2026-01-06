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

- **`.zshrc`**: Main shell configuration (tracked in repo)
- **`.zshrc.work`**: Work-related secrets and configurations (gitignored, NOT tracked)
- The `.zshrc` conditionally sources `.zshrc.work` if it exists
- **Never commit work-related secrets, tokens, or company-specific configurations**

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

- **`~/.claude/settings.template.json`**: Tracked template (copy to `settings.json` on new machines)
- **`~/.claude/settings.json`**: Actual config (gitignored, modified by `/model` command)
- **`~/.claude/CLAUDE.work.md`**: Work-specific instructions (gitignored, not tracked)

Work-related Claude Code configuration (AWS Bedrock, Jira, Confluence) is documented in `~/.claude/CLAUDE.work.md`.

## When Adding New Dotfiles

1. Check if file contains sensitive information (API keys, tokens, work-specific paths)
2. If sensitive: add to `.zshrc.work` or similar work-specific file, ensure it's gitignored
3. If safe: add with `config add <file>` and commit
4. Update `.gitignore` if creating new categories of excluded files
