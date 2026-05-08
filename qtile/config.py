from libqtile import layout
from libqtile.config import Key, Group, Screen
from libqtile.lazy import lazy
from pathlib import Path

from bar import topBar
from globals import mod
from keymap import Keymap
from colors import Colors

keys = Keymap.keys

groups = [Group(str(i)) for i in range(1, 10)]
for group in groups:
    keys.extend([
        Key([mod], group.name, lazy.group[group.name].toscreen()),
        Key([mod, "shift"], group.name, lazy.window.togroup(group.name)),
    ])

layouts = [
    layout.Bsp(
        border_focus=Colors.orange,
        border_on_single=True,
        margin=5
    ),
]

wallpaper_path = Path(__file__).resolve().parent / "background.jpg"

screens = [
    Screen(
        top=topBar,
        wallpaper=str(wallpaper_path),
        wallpaper_mode="fill",
    )
]

# Basic settings
dgroups_key_binder = None
follow_mouse_focus = True
bring_front_click = False
