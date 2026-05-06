from libqtile.lazy import lazy
from libqtile.config import Key

from globals import mod, terminal, launcher

class Keymap:
    keys = [
        # Basics
        Key([mod], "Return", lazy.spawn(terminal)),
        Key([mod], "d", lazy.spawn(launcher)),
        Key([mod, "shift"], "q", lazy.window.kill()),

        # Reload / exit
        Key([mod, "control"], "r", lazy.reload_config()),
        Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),


        # Focus movement (vim + arrows)
        Key([mod], "h", lazy.layout.left()),
        Key([mod], "j", lazy.layout.down()),
        Key([mod], "k", lazy.layout.up()),
        Key([mod], "l", lazy.layout.right()),

        Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
        Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
        Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
        Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
        
        # Layout controls
        Key([mod], "b", lazy.layout.toggle_split()),
        Key([mod], "v", lazy.layout.toggle_split()),


        Key([mod], "f", lazy.window.toggle_fullscreen()),

        # Floating toggle
        Key([mod, "shift"], "space", lazy.window.toggle_floating()),

        # Focus floating vs tiling
        Key([mod], "space", lazy.group.next_window()),
        
        Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
        Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
        Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
        Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
         
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

