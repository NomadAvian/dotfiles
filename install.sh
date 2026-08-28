#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

link() {
  local src="$1"
  local dst="$2"
  if [ -L "$dst" ]; then
    rm "$dst"
  elif [ -e "$dst" ]; then
    echo "warning: $dst already exists, backing up to ${dst}.bak"
    mv "$dst" "${dst}.bak"
  fi
  mkdir -p "$(dirname "$dst")"
  ln -s "$src" "$dst"
  echo "linked $dst -> $src"
}

# Shell
link "$DOTFILES_DIR/.bashrc"       "$HOME/.bashrc"
link "$DOTFILES_DIR/.bash_aliases" "$HOME/.bash_aliases"

# Tmux
link "$DOTFILES_DIR/.tmux.conf"    "$HOME/.tmux.conf"
link "$DOTFILES_DIR/.tmux"         "$HOME/.tmux"

# .config
link "$DOTFILES_DIR/.config/kitty" "$HOME/.config/kitty"
link "$DOTFILES_DIR/.config/nvim"  "$HOME/.config/nvim"

echo ""
echo "done. restart your shell or run: source ~/.bashrc"
