#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_TARGET="${XDG_CONFIG_HOME:-$HOME/.config}"

mkdir -p "$CONFIG_TARGET"

remove_target_config() {
    local pkg="$1"
    local target_dir="$CONFIG_TARGET/$pkg"
    local source_dir="$DOTFILES_DIR/$pkg/.config/$pkg"

    # Only act if the source package actually exists in the dotfiles repo
    if [ ! -d "$source_dir" ]; then
        return
    fi

    if [ -e "$target_dir" ] || [ -L "$target_dir" ]; then
        echo "Removing existing target: $target_dir"
        rm -rf "$target_dir"
    fi
}

# --------------------------
# Install vim-plug if missing
# --------------------------
echo "Installing vim-plug..."
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# --------------------------
# Define configs to stow
# --------------------------
PACKAGES=("nvim" "fish" "Xmodmap" "fonts")

for pkg in "${PACKAGES[@]}"; do
    echo
    echo "=== Processing $pkg ==="

    remove_target_config "$pkg"

    echo "Stowing $pkg..."
    stow --restow --dir="$DOTFILES_DIR" --target="$HOME" "$pkg"
done

echo "All packages stowed successfully."

#---------------------------
# rebuild font cache
#---------------------------
fc-cache -fv

# --------------------------
# Nvim PlugInstall once
# --------------------------
echo "Installing Neovim plugins..."
nvim --headless +PlugInstall +qall
