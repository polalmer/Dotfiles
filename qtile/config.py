from libqtile import bar, layout, widget
from libqtile.config import Key, Group, Screen
from libqtile.lazy import lazy

mod = "mod4"
terminal = "alacritty"
launcher = "rofi -show run"

keys = [
    # Basics
    Key([mod], "Return", lazy.spawn(terminal)),
    Key([mod], "d", lazy.spawn(launcher)),
    Key([mod, "shift"], "q", lazy.window.kill()),

    # Reload / exit
    Key([mod, "shift"], "c", lazy.reload_config()),
    Key([mod, "shift"], "e", lazy.shutdown()),

    # Focus movement (vim + arrows)
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "l", lazy.layout.right()),

    Key([mod], "Left", lazy.layout.left()),
    Key([mod], "Down", lazy.layout.down()),
    Key([mod], "Up", lazy.layout.up()),
    Key([mod], "Right", lazy.layout.right()),

    # Move windows
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),

    Key([mod, "shift"], "Left", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right()),

    # Layout controls
    Key([mod], "b", lazy.layout.toggle_split()),
    Key([mod], "v", lazy.layout.toggle_split()),

    Key([mod], "s", lazy.next_layout()),  # stacking-ish
    Key([mod], "w", lazy.next_layout()),  # tabbed alternative
    Key([mod], "e", lazy.layout.toggle_split()),

    Key([mod], "f", lazy.window.toggle_fullscreen()),

    # Floating toggle
    Key([mod, "shift"], "space", lazy.window.toggle_floating()),

    # Focus floating vs tiling
    Key([mod], "space", lazy.group.next_window()),

    # Resize mode (approximation)
    Key([mod], "r", lazy.layout.grow()),

    # Audio
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%")),

    # Brightness
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 5%-")),
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set 5%+")),

    # Screenshot
    Key([], "Print", lazy.spawn("grim")),
]

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
        top=bar.Bar(
            [
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Clock(format="%d-%m-%Y %H:%M:%S"),
            ],
            24,
        ),
    ),
]

# Basic settings
dgroups_key_binder = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
