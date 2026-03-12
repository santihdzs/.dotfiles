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

# Oh My Zsh configuration
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="gozilla"

# Plugins
plugins=(git)

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Starship prompt (optional - comment out if using OMZ theme)
# if command -v starship >/dev/null 2>&1; then
#   eval "$(starship init zsh)"
# fi

# Aliases
alias activate="source .venv/bin/activate"
alias newvenv="python -m venv .venv"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Pyenv brew fix
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

# bun
if [ -s "$HOME/.bun/_bun" ]; then
  source "$HOME/.bun/_bun"
fi
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
