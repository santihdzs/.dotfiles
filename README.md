# dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Quick Start
```bash
git clone https://github.com/santihdzs/dotfiles ~/.dotfiles
cd ~/.dotfiles
./setup
```

## Available Modes
```bash
./setup              # full setup (bootstrap + packages + dotfiles)
./setup bootstrap    # install tools only (TPM, bun)
./setup packages     # install system packages only
./setup dotfiles     # create stow symlinks only
```

## Directory Structure

```
dotfiles/
|-- setup                  # Main entry point
|-- packages/              # Package lists
|   |-- pacman.txt        # Pacman packages (Linux)
|   |-- aur.txt           # AUR packages (Linux)
|   +-- mac.brew.txt     # Homebrew packages (macOS)
|-- scripts/
|   |-- bootstrap          # Install tools (TPM, bun)
|   |-- install_packages  # Install system packages
|   |-- install_dotfiles  # Create stow symlinks
|   +-- helpers/
|       +-- os_detect    # Detect OS: linux | mac
+-- stow/                 # Dotfiles to symlink
    |-- common/           # Shared across all OS
    |-- linux/            # Linux-specific
    +-- mac/             # macOS-specific
```

## What's in stow/common/

- **zsh/.zshrc** - Zsh config (autosuggestions, syntax highlighting, OMP)
- **tmux/.tmux.conf** - Tmux config (catppuccin theme, Ctrl+Space prefix)
- **nvim/** - Neovim config (NvChad-based)

## OS Detection
- **mac**: macOS (Darwin)
- **linux**: Any Linux distro

## Adding New Dotfiles

1. Add file to `stow/common/` (or `linux/`/`mac/` for OS-specific)
2. Add packages to `packages/` if needed
3. Run `./setup dotfiles`

## Backup

Conflict files moved to `~/.dotfiles-backup/<timestamp>/` before symlinking.
