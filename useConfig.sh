#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
HOME_DIR="${XDG_CONFIG_HOME:-$HOME}"
CONFIG_TARGET="$HOME_DIR/.config"

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
echo "Linked dotfiles"

linkFonts

echo "Done."

linkPath() {
    local source="$1"
    local target="$2"

    if [[ ! -e "$source" && ! -L "$source" ]]; then
        echo "Missing source, skipping: $source"
        return
    fi

    mkdir -p "$(dirname "$target")"

    if [[ -e "$target" || -L "$target" ]]; then
        rm -rf "$target"
    fi

    ln -s "$source" "$target"
    echo "Linked: $target -> $source"
}

linkFonts(){
    echo "Installing font..."
    FONT_SOURCE_DIR="$DOTFILES_DIR/fonts"
    FONT_TARGET="$USER_FONT_TARGET"
    mkdir -p "$FONT_TARGET"
    find "$FONT_SOURCE_DIR" -maxdepth 1 -type f \( -name "*.ttf" -o -name "*.otf" \) -exec cp -f {} "$FONT_TARGET/" \;

    if command -v fc-cache >/dev/null 2>&1; then
        fc-cache -f "$FONT_TARGET"
    else
        echo "fc-cache not found; font cache was not refreshed."
    fi
}
