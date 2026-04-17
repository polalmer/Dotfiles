# Dotfiles
Install listed apps +
- eza for fish
- alacritty terminal
- rofi window switcher

Run `./useConfig.sh` to symlink the repo folders to your home/config paths.

Sway output profile can be selected during install:
- `./useConfig.sh --display-profile laptop`
- `./useConfig.sh --display-profile pc`
The script links the selected profile to `~/.config/sway-display.conf`.

Fonts are also linked system-wide under `/usr/local/share/fonts/dotfiles` (via `sudo`) so they are available for all users, including `root`.

## Fish
Shell configs (colors, abbreviations)

## Nvim
texteditor configs

## Sway
tiling window manager wayland
