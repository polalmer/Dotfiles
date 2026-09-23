#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
HOME_DIR="${XDG_CONFIG_HOME:-$HOME}"
CONFIG_TARGET="$HOME_DIR/.config"

. ./scripts/linkPath.sh
echo "Linking dotfiles..."
mkdir -p "$CONFIG_TARGET"
linkPath "$DOTFILES_DIR/mango" "$CONFIG_TARGET/mango"
linkPath "$DOTFILES_DIR/nvim" "$CONFIG_TARGET/nvim"
linkPath "$DOTFILES_DIR/fish" "$CONFIG_TARGET/fish"
linkPath "$DOTFILES_DIR/eza" "$CONFIG_TARGET/eza"
linkPath "$DOTFILES_DIR/alacritty" "$CONFIG_TARGET/alacritty"
linkPath "$DOTFILES_DIR/fastfetch" "$CONFIG_TARGET/fastfetch"
linkPath "$DOTFILES_DIR/noctalia" "$CONFIG_TARGET/noctalia"
linkPath "$DOTFILES_DIR/WiiCursor" "$HOME_DIR/.icons"
:
. ./scripts/linkFonts.sh
linkFonts

echo "Done."
