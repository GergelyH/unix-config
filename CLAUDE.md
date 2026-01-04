# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Architecture

This is a **bare git repository** for managing dotfiles using the "config" alias pattern:
- Git directory: `$HOME/dotfiles/`
- Work tree: `$HOME` (the entire home directory)
- All git operations MUST use the `config` alias, NOT the `git` command

## Essential Commands

### Git Operations
**CRITICAL**: Always use `config` instead of `git` when working with this repository:

```bash
# Check status
config status

# Add files
config add <file>

# Commit changes
config commit -m "message"

# Push/pull
config push
config pull

# View tracked files
config ls-files

# Show diff
config diff
```

**Never use `git` commands directly** - they will operate on the wrong repository or fail.

### Editing Tracked Files

The repository currently tracks:
- `.zshrc` - Main shell configuration
- `.gitignore` - Excludes work-specific files
- `.github/workflows/claude-code-review.yml` - Automated PR reviews
- `.github/workflows/claude.yml` - @claude mention handler
- `Library/Application Support/pypoetry/config.toml` - Poetry configuration (virtualenvs.in-project = true)

### Adding New Dotfiles

When adding new dotfiles to track:
1. Use `config add -f <file>` (force flag may be needed due to gitignore patterns)
2. Commit with `config commit`
3. Consider privacy: never track secrets, work-specific configs, or credentials

## Key Patterns

### Work Configuration Separation
- `.zshrc.work` is intentionally gitignored (see `.gitignore`)
- Work-related secrets and configuration go in `.zshrc.work`
- `.zshrc` sources `.zshrc.work` if it exists (line 54-57)
- This keeps work-specific settings out of version control

### Shell Configuration (.zshrc)
- Uses vim keybindings (`bindkey -v`)
- Default editor: nvim
- Custom function: `create_worktree()` for git worktree management
- PATH includes: ~/bin, ~/.local/bin, pyenv, Node 20, Google Cloud SDK

### GitHub Actions Integration
- **Claude Code Review**: Automatically reviews all PRs using Claude Code (references CLAUDE.md for guidance)
- **Claude Assistant**: Responds to @claude mentions in issues/PRs/comments
- Both require `CLAUDE_CODE_OAUTH_TOKEN` secret configured in repository settings

## Development Workflow

1. Check what would be committed: `config status`
2. Review changes: `config diff`
3. Stage files: `config add <file>`
4. Commit: `config commit -m "descriptive message"`
5. Push: `config push`

**Important**: Since the work tree is your entire home directory, `config status` will show many untracked files. This is normal - only explicitly added files are tracked.
