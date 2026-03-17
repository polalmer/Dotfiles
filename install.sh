#!/usr/bin/env bash
set -e

# --------------------------
# Helper: remove conflicting files
# --------------------------
remove_conflict() {
    local target="$1"
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo "Removing existing file: $target"
        rm -rf "$target"
    fi
}

# --------------------------
# Install vim-plug if missing
# --------------------------
echo "Installing vim-plug..."
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# --------------------------
# Stow dotfiles
# --------------------------
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_TARGET="$HOME/.config"

echo "Preparing ~/.config..."
mkdir -p "$CONFIG_TARGET"

#-----------------------
# stowed configs
#----------------------
PACKAGES=("nvim" "fish")

for pkg in "${PACKAGES[@]}"; do
    echo "Processing package: $pkg"

    # Find all files in the package
    find "$DOTFILES_DIR/$pkg/.config" -type f | while read -r file; do
        # Compute target location
        relative_path="${file#$DOTFILES_DIR/$pkg/}"
        target="$HOME/$relative_path"

        # Remove conflict if exists
        remove_conflict "$target"
    done

    # Restow package (symlink creation)
    echo "Stowing $pkg..."
    stow --restow --dir="$DOTFILES_DIR" --target="$HOME" "$pkg"
done

echo "All packages stowed successfully."
