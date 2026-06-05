#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_TARGET="${XDG_CONFIG_HOME:-$HOME/.config}"

. ./scripts/linkPath.sh
echo "Linking dotfiles..."
mkdir -p "$CONFIG_TARGET"
linkPath "$DOTFILES_DIR/qtile" "$CONFIG_TARGET/qtile"
linkPath "$DOTFILES_DIR/nvim" "$CONFIG_TARGET/nvim"
linkPath "$DOTFILES_DIR/fish" "$CONFIG_TARGET/fish"
linkPath "$DOTFILES_DIR/eza" "$CONFIG_TARGET/eza"
linkPath "$DOTFILES_DIR/alacritty" "$CONFIG_TARGET/alacritty"
linkPath "$DOTFILES_DIR/rofi" "$CONFIG_TARGET/rofi"

. ./scripts/linkFonts.sh
linkFonts

echo "Done."
