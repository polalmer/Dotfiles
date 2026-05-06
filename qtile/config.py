from libqtile import layout
from libqtile.config import Key, Group, Screen
from libqtile.lazy import lazy

from bar import topBar
from globals import mod
from keymap import Keymap

keys = Keymap.keys

groups = [Group(str(i)) for i in range(1, 10)]
for group in groups:
    keys.extend([
        Key([mod], group.name, lazy.group[group.name].toscreen()),
        Key([mod, "shift"], group.name, lazy.window.togroup(group.name)),
    ])

layouts = [
    layout.Bsp(),
]

screens = [
    Screen(
        top=topBar,
        wallpaper='background.jpg'
    )
]

# Basic settings
dgroups_key_binder = None
follow_mouse_focus = True
bring_front_click = False
