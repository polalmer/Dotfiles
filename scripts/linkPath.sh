linkPath() {
    local source="$1"
    local target="$2"

    SYSTEM_FONT_TARGET="/usr/share/fonts/TTF"
    USER_FONT_TARGET="${XDG_DATA_HOME:-$HOME/.local/share}/fonts"

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
