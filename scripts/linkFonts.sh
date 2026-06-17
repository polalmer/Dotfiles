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
