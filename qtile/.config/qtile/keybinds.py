from libqtile.config import Key, Group
from libqtile.lazy import lazy
from statics import  Keys, Apps

def GetKeyBindings():
    return [
        # A list of available commands that can be bound to keys can be found
        # at https://docs.qtile.org/en/latest/manual/config/lazy.html
        # Switch between windows
        Key([Keys.windows], "Left", lazy.layout.left(), desc="Move focus to left"),
        Key([Keys.windows], "Right", lazy.layout.right(), desc="Move focus to right"),
        Key([Keys.windows], "Down", lazy.layout.down(), desc="Move focus down"),
        Key([Keys.windows], "Up", lazy.layout.up(), desc="Move focus up"),
        Key([Keys.windows], "h", lazy.layout.left(), desc="Move focus to left"),
        Key([Keys.windows], "l", lazy.layout.right(), desc="Move focus to right"),
        Key([Keys.windows], "j", lazy.layout.down(), desc="Move focus down"),
        Key([Keys.windows], "k", lazy.layout.up(), desc="Move focus up"),
        # Move windows between left/right columns or move up/down in current stack.
        # Moving out of range in Columns layout will create new column.
        Key([Keys.windows, Keys.shift], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
        Key([Keys.windows, Keys.shift], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
        Key([Keys.windows, Keys.shift], "j", lazy.layout.shuffle_down(), desc="Move window down"),
        Key([Keys.windows, Keys.shift], "k", lazy.layout.shuffle_up(), desc="Move window up"),

        Key([Keys.windows, Keys.shift], "h", lazy.layout.mode_horizontal_split(), desc="Horizontal split"),
        Key([Keys.windows, Keys.shift], "v", lazy.layout.mode_vertical_split(), desc="Vertical split"),

        # Grow windows. If current window is on the edge of screen and direction
        # will be to screen edge - window would shrink.
        Key([Keys.windows, Keys.ctrl], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
        Key([Keys.windows, Keys.ctrl], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
        Key([Keys.windows, Keys.ctrl], "j", lazy.layout.grow_down(), desc="Grow window down"),
        Key([Keys.windows, Keys.ctrl], "k", lazy.layout.grow_up(), desc="Grow window up"),
        Key([Keys.windows], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
        Key([Keys.windows], "f", lazy.window.toggle_fullscreen(), desc="Toggle focused window to fullscreen"),

        #Launch key
        Key([Keys.windows], "Return", lazy.spawn(Apps.terminal), desc="Launch terminal"),
        Key([Keys.windows], "q", lazy.window.kill(), desc="Kill focused window"),
        Key([Keys.windows, Keys.ctrl], "r", lazy.reload_config(), desc="Reload the config"),
        Key([Keys.windows, Keys.ctrl], "q", lazy.shutdown(), desc="Shutdown Qtile"),
        # Search App
        Key([Keys.windows], "d", lazy.spawn("rofi -theme rounded-green-dark -show drun"),
            desc="Spawn a command using a prompt widget"),

        ##CUSTOM
        Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume 0 +1%"), desc='Volume Up'),
        Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume 0 -1%"), desc='volume down'),
        Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle"), desc='Volume Mute'),
        Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause"), desc='playerctl'),
        Key([], "XF86AudioPrev", lazy.spawn("playerctl previous"), desc='playerctl'),
        Key([], "XF86AudioNext", lazy.spawn("playerctl next"), desc='playerctl'),
        Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl s 5%+"), desc='brightness UP'),
        Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl s 5%-"), desc='brightness Down'),

        ##Misc keybinds
        Key([], "Print", lazy.spawn("flameshot gui"), desc='Screenshot'),
        Key([Keys.ctrl], "Print", lazy.spawn("flameshot full -c -p ~/Pictures/"), desc='Screenshot'),
        Key([Keys.windows], "e", lazy.spawn(Apps.filemanager), desc="Open file manager"),
        Key([Keys.windows], "s", StickyWindows.toggle_sticky_windows(), desc="Toggle state of sticky for current window"),
    ]
