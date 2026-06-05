linkFonts(){
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
}
