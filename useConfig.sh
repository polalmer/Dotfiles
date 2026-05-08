#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_TARGET="${XDG_CONFIG_HOME:-$HOME/.config}"
SYSTEM_FONT_TARGET="/usr/share/fonts/TTF"
USER_FONT_TARGET="${XDG_DATA_HOME:-$HOME/.local/share}/fonts"

mkdir -p "$CONFIG_TARGET"

link_path() {
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

echo "Linking dotfiles..."
link_path "$DOTFILES_DIR/qtile" "$CONFIG_TARGET/qtile"
link_path "$DOTFILES_DIR/nvim" "$CONFIG_TARGET/nvim"
link_path "$DOTFILES_DIR/fish" "$CONFIG_TARGET/fish"
link_path "$DOTFILES_DIR/eza" "$CONFIG_TARGET/eza"
link_path "$DOTFILES_DIR/alacritty" "$CONFIG_TARGET/alacritty"
link_path "$DOTFILES_DIR/rofi" "$CONFIG_TARGET/rofi"

echo "Installing font..."
FONT_SOURCE_DIR="$DOTFILES_DIR/fonts"
if [[ -w "$SYSTEM_FONT_TARGET" ]] || [[ ! -e "$SYSTEM_FONT_TARGET" && -w "$(dirname "$SYSTEM_FONT_TARGET")" ]]; then
    FONT_TARGET="$SYSTEM_FONT_TARGET"
else
    FONT_TARGET="$USER_FONT_TARGET"
    echo "No write access to $SYSTEM_FONT_TARGET, installing fonts to user directory: $FONT_TARGET"
fi

mkdir -p "$FONT_TARGET"
find "$FONT_SOURCE_DIR" -maxdepth 1 -type f \( -name "*.ttf" -o -name "*.otf" \) -exec cp -f {} "$FONT_TARGET/" \;

if command -v fc-cache >/dev/null 2>&1; then
    fc-cache -f "$FONT_TARGET"
else
    echo "fc-cache not found; font cache was not refreshed."
fi

echo "Installing vim-plug..."
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing Neovim plugins..."
nvim --headless +PlugInstall +qall

echo "Done."
