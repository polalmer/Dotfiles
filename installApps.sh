  #!/usr/bin/env bash

set -e

JSON_FILE="${./apps.json}"

# Ensure jq exists
if ! command -v jq &> /dev/null; then
    echo "jq is required but not installed."
    sudo pacman -Sy jq
fi

echo "Reading package list from $JSON_FILE..."

# Read pacman packages
PACMAN_PKGS=$(jq -r '.pacman[]' "$JSON_FILE")

# Install pacman packages
if [ -n "$PACMAN_PKGS" ]; then
    echo "Installing pacman packages..."
    sudo pacman -Sy --needed --noconfirm $PACMAN_PKGS
fi

# Check if yay exists
if ! command -v yay &> /dev/null; then
    echo "yay not found. Installing yay..."

    TEMP_DIR=$(mktemp -d)

    git clone https://aur.archlinux.org/yay.git "$TEMP_DIR/yay"

    cd "$TEMP_DIR/yay"

    makepkg -si --noconfirm

    cd -

    rm -rf "$TEMP_DIR"
fi

# Read AUR packages
AUR_PKGS=$(jq -r '.AUR[]' "$JSON_FILE")

# Install AUR packages (skip yay itself if listed)
if [ -n "$AUR_PKGS" ]; then
    echo "Installing AUR packages..."

    for pkg in $AUR_PKGS; do
        if [ "$pkg" != "yay" ]; then
            yay -Sy --needed --noconfirm "$pkg"
        fi
    done
fi

echo "All packages installed successfully."
