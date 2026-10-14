#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
HOME_DIR="${XDG_CONFIG_HOME:-$HOME}"
CONFIG_TARGET="$HOME_DIR/.config"

linkPath() {
    local source="$2"
    local target="$3"
    local use_sudo="$1"

    if [[ ! -e "$source" && ! -L "$source" ]]; then
        echo "Missing source, skipping: $source"
        return
    fi

    if [[ "$use_sudo" == "sudo" ]]; then
        sudo mkdir -p "$(dirname "$target")"
    else
        mkdir -p "$(dirname "$target")"
    fi

    if [[ -L "$target" && "$(readlink -- "$target")" == "$source" ]]; then
        echo "Already linked: $target -> $source"
        return
    fi

    if [[ -e "$target" || -L "$target" ]]; then
        local backup_stamp
        local backup_target
        local backup_suffix=1

        backup_stamp="$(date +%Y%m%d%H%M%S).$$"
        backup_target="${target}.backup.${backup_stamp}"
        while [[ -e "$backup_target" || -L "$backup_target" ]]; do
            backup_target="${target}.backup.${backup_stamp}.${backup_suffix}"
            ((backup_suffix += 1))
        done

        if [[ "$use_sudo" == "sudo" ]]; then
            sudo mv -nT -- "$target" "$backup_target"
        else
            mv -nT -- "$target" "$backup_target"
        fi

        if [[ -e "$target" || -L "$target" ]]; then
            echo "Could not safely preserve existing target: $target" >&2
            return 1
        fi
        echo "Preserved existing target at: $backup_target"
    fi

    if [[ "$use_sudo" == "sudo" ]]; then
        sudo ln -s -- "$source" "$target"
    else
        ln -s -- "$source" "$target"
    fi
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
echo "enable keyd"
linkPath sudo "$DOTFILES_DIR/keyd" "/etc/keyd"
sudo systemctl enable keyd --now
echo "Linked dotfiles"

linkFonts

echo "Done."
