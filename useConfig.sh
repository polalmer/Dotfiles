#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_TARGET="${XDG_CONFIG_HOME:-$HOME/.config}"
SYSTEM_FONTS_PARENT="/usr/local/share/fonts"
SYSTEM_FONTS_LINK="${SYSTEM_FONTS_PARENT}/dotfiles"
DISPLAY_PROFILE="${SWAY_DISPLAY_PROFILE:-default}"

usage() {
    cat <<EOF
Usage: $0 [--display-profile <name>] [--no-system-fonts]

Options:
  --display-profile <name>   Sway display profile from sway/.config/sway/displays (default: ${DISPLAY_PROFILE})
  --no-system-fonts          Skip linking fonts into ${SYSTEM_FONTS_LINK}
  -h, --help                 Show this help
EOF
}

SETUP_SYSTEM_FONTS=1

while [[ $# -gt 0 ]]; do
    case "$1" in
        --display-profile)
            [[ $# -lt 2 ]] && { echo "Missing value for --display-profile" >&2; exit 1; }
            DISPLAY_PROFILE="$2"
            shift 2
            ;;
        --no-system-fonts)
            SETUP_SYSTEM_FONTS=0
            shift
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        *)
            echo "Unknown option: $1" >&2
            usage
            exit 1
            ;;
    esac
done

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
link_path "$DOTFILES_DIR/sway" "$CONFIG_TARGET/sway"
link_path "$DOTFILES_DIR/nvim" "$CONFIG_TARGET/nvim"
link_path "$DOTFILES_DIR/fish" "$CONFIG_TARGET/fish"
link_path "$DOTFILES_DIR/eza" "$CONFIG_TARGET/eza"
link_path "$DOTFILES_DIR/fonts" "$HOME/.fonts"
link_path "$DOTFILES_DIR/alacritty" "$CONFIG_TARGET/alacritty"


DISPLAY_PROFILE_SOURCE="$DOTFILES_DIR/sway/displays/${DISPLAY_PROFILE}.conf"
DISPLAY_PROFILE_TARGET="$CONFIG_TARGET/sway-display.conf"

if [[ ! -f "$DISPLAY_PROFILE_SOURCE" ]]; then
    echo "Sway display profile not found: $DISPLAY_PROFILE_SOURCE" >&2
    echo "Available profiles:" >&2
    find "$DOTFILES_DIR/sway/displays" -maxdepth 1 -type f -name '*.conf' -printf '  %f\n' 2>/dev/null | sed 's/\.conf$//' >&2 || true
    exit 1
fi

link_path "$DISPLAY_PROFILE_SOURCE" "$DISPLAY_PROFILE_TARGET"
echo "Using Sway display profile: ${DISPLAY_PROFILE}"

if [[ "$SETUP_SYSTEM_FONTS" -eq 1 ]]; then
    echo "Linking fonts system-wide for all users (sudo required)..."
    sudo mkdir -p "$SYSTEM_FONTS_PARENT"
    sudo rm -rf "$SYSTEM_FONTS_LINK"
    sudo ln -s "$DOTFILES_DIR/fonts/.fonts" "$SYSTEM_FONTS_LINK"
    sudo fc-cache -fv
fi

echo "Rebuilding user font cache..."
fc-cache -fv

echo "Installing vim-plug..."
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing Neovim plugins..."
nvim --headless +PlugInstall +qall

echo "Done."
