#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_TARGET="${XDG_CONFIG_HOME:-$HOME/.config}"

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

echo "Installing vim-plug..."
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing Neovim plugins..."
nvim --headless +PlugInstall +qall

echo "Done."
