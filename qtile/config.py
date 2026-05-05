from libqtile import bar, layout, widget
from libqtile.config import Key, Group, Screen
from libqtile.lazy import lazy

from colors import Colors
from keymap import Keymap
from globals import mod, terminal, launcher
from bar import topBar

keys = Keymap.keys


# Workspaces (Groups)
groups = [Group(str(i)) for i in range(1, 11)]

for group in groups:
    keys.extend([
        Key([mod], group.name, lazy.group[group.name].toscreen()),
        Key([mod, "shift"], group.name, lazy.window.togroup(group.name)),
    ])

# Layouts (approximate sway behavior)
layouts = [
    layout.Columns(),   # closest to tiling splits
    layout.Max(),       # fullscreen/tabbed-like
    layout.Stack(num_stacks=2),  # stacking behavior
]

# Bar (similar to swaybar)
screens = [
    Screen(
        top=topBar
    ),
    wallpaper=background.jpg
]

# Basic settings
dgroups_key_binder = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
