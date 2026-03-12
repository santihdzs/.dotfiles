# Paths
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# XDG base dirs (tidy)
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

# Zsh completions
autoload -Uz compinit
compinit -d "${XDG_CACHE_HOME}/zsh/zcompdump"

# Antidote plugin manager
if [ -f "$HOME/.antidote/antidote.zsh" ]; then
  source "$HOME/.antidote/antidote.zsh"
fi

# Load plugins from static file (regenerate if .zsh_plugins.txt is newer)
zsh_plugins=${ZDOTDIR:-$HOME}/.zsh_plugins
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  (
    source $HOME/.antidote/antidote.zsh
    antidote bundle <${zsh_plugins}.txt >${zsh_plugins}.zsh
  )
fi
source ${zsh_plugins}.zsh

# Zoxide (smarter cd)
eval "$(zoxide init zsh)"

# Oh My Posh prompt
if command -v oh-my-posh >/dev/null 2>&1; then
  eval "$(oh-my-posh init zsh --config='$HOME/.config/ohmyposh/zen.toml')"
fi

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Aliases
alias vim='nvim'
alias c='clear'
alias ls='ls --color'

# bun
if [ -s "$HOME/.bun/_bun" ]; then
  source "$HOME/.bun/_bun"
fi
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# uv (Python package manager)
if command -v uv >/dev/null 2>&1; then
  export UV_PYTHON="$HOME/.local/share/uv/python"
fi
