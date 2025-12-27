bindkey -v
# Set the default editor
export EDITOR="nvim"  # Change to your preferred editor (e.g., vim, code)

# Enable color support
autoload -U compinit
compinit

# Enable syntax highlighting (if you have it installed)
# This assumes you have zsh-syntax-highlighting installed
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Set prompt
autoload -Uz promptinit
promptinit
prompt adam1  # Change to your preferred prompt style

# Set aliases
# alias ll='ls -la'
# alias gs='git status'
# alias ..='cd ..'

# Customize the PATH
export PATH="$HOME/bin:$PATH"
export PATH="/Users/ghalacsy/Library/Python/3.9/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH" # required by pipx for example

# Set history options
HISTSIZE=1000
SAVEHIST=1000
setopt append_history
setopt share_history

# Load additional scripts
# if [ -f ~/.zsh_aliases ]; then
  #source ~/.zsh_aliases
#fi
#
#if [ -f ~/.zsh_functions ]; then
  #source ~/.zsh_functions
#fi
create_worktree() {
    git worktree add -b "$1" "../$1" main
}

export PATH="/opt/homebrew/opt/node@20/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ghalacsy/opt/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ghalacsy/opt/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ghalacsy/opt/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ghalacsy/opt/google-cloud-sdk/completion.zsh.inc'; fi

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

. "$HOME/.local/bin/env"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/ghalacsy/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
#
export CLAUDE_CODE_USE_BEDROCK=1
# export ANTHROPIC_MODEL='global.anthropic.claude-sonnet-4-5-20250929-v1:0'
# export ANTHROPIC_SMALL_FAST_MODEL='us.anthropic.claude-haiku-4-5-20251001-v1:0'
export ANTHROPIC_DEFAULT_HAIKU_MODEL=global.anthropic.claude-haiku-4-5-20251001-v1:0
export ANTHROPIC_DEFAULT_SONNET_MODEL=global.anthropic.claude-sonnet-4-5-20250929-v1:0
export ANTHROPIC_DEFAULT_OPUS_MODEL=us.anthropic.claude-opus-4-1-20250805-v1:0
# Recommended output token settings for Bedrock
export CLAUDE_CODE_MAX_OUTPUT_TOKENS=4096
export MAX_THINKING_TOKENS=1024

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# Source work-related configuration if it exists
if [ -f "$HOME/.zshrc.work" ]; then
    source "$HOME/.zshrc.work"
fi
