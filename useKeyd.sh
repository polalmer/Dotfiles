#!/usr/bin/env bash

. ./scripts/linkPath.sh
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
linkPath "$DOTFILES_DIR/keyd" "/etc/keyd"

echo "enable keyd"
systemctl enable keyd --now

