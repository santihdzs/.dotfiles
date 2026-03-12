# Paths
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# XDG base dirs (tidy)
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

# Enable autocd (typing .. or ... auto-cds)
setopt autocd

# Antidote plugin manager (must load before compinit)
if [ -f "$HOME/.antidote/antidote.zsh" ]; then
  source "$HOME/.antidote/antidote.zsh"
fi

# Load plugins from static file
zsh_plugins=${ZDOTDIR:-$HOME}/.zsh_plugins
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  (
    source $HOME/.antidote/antidote.zsh
    antidote bundle <${zsh_plugins}.txt >${zsh_plugins}.zsh
  )
fi
source ${zsh_plugins}.zsh

# Zsh completions (load AFTER plugins)
autoload -Uz compinit
compinit -d "${XDG_CACHE_HOME}/zsh/zcompdump"

# Completion styling (case-insensitive, like octavio)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':completion:*' special-dirs true

# Zoxide (smarter cd)
eval "$(zoxide init zsh)"

# Oh My Posh
if command -v oh-my-posh >/dev/null 2>&1; then
  eval "$(oh-my-posh init zsh --config='$HOME/.dotfiles/stow/common/ohmyposh/zen.toml')"
fi

# Keybindings
bindkey -e

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups

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

# uv
if command -v uv >/dev/null 2>&1; then
  export UV_PYTHON="$HOME/.local/share/uv/python"
fi
