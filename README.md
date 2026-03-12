# dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Usage
```bash
git clone https://github.com/santihdzs/dotfiles ~/.dotfiles
cd ~/.dotfiles
./setup
```

## Modes
```bash
./setup              # full setup (default)
./setup bootstrap    # tools only (TPM, bun)
./setup packages     # install packages only
./setup dotfiles    # stow symlinks only
```

## Structure
```
dotfiles/
|-- setup                  # entrypoint
|-- packages/
|   |-- arch.pacman.txt   # pacman packages (Linux)
|   |-- arch.aur.txt      # AUR packages (Linux)
|   +-- mac.brew.txt      # homebrew packages (macOS)
|-- scripts/
|   |-- bootstrap          # TPM, bun
|   |-- install_packages   # pacman/brew/AUR
|   |-- install_dotfiles   # stow symlinks
|   +-- helpers/
|       +-- os_detect     # prints: linux | mac
+-- stow/
    |-- common/           # applied on all OS
    |-- linux/            # Linux-specific
    +-- mac/             # macOS-specific
```

## OS Detection

- **mac**: macOS (Darwin)
- **linux**: Any Linux distribution (Arch, Debian, Ubuntu, etc.)

## Adding a new dotfile

1. Mirror the path inside `stow/common/` (or `linux/`/`mac/` if OS-specific)
2. Add the package to the relevant package list if needed
3. Run `./setup dotfiles`

## Backups

Existing files that would conflict are moved to `~/.dotfiles-backup/<timestamp>/` before symlinking.
