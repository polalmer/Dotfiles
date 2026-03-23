from libqtile import layout
from libqtile.config import Click, Drag, Group, Key, Match, hook
from libqtile.lazy import lazy
from screen import *
from keybinds import GetKeyBindings
from statics import Colors, Keys

# Sticky windows
sticky_windows = []

@lazy.function
def toggle_sticky_windows(qtile, window=None):
    if window is None:
        window = qtile.current_screen.group.current_window
    if window in sticky_windows:
        sticky_windows.remove(window)
    else:
        sticky_windows.append(window)
    return window

@hook.subscribe.setgroup
def move_sticky_windows():
    for window in sticky_windows:
        window.togroup()
    return

@hook.subscribe.client_killed
def remove_sticky_windows(window):
    if window in sticky_windows:
        sticky_windows.remove(window)

# Below is an example how to make Firefox Picture-in-Picture windows automatically sticky.
@hook.subscribe.client_managed
def auto_sticky_windows(window):
    info = window.info()
    if (info['wm_class'] == ['Toolkit', 'firefox']
            and info['name'] == 'Picture-in-Picture'):
        sticky_windows.append(window)


#Keybinds
keys = GetKeyBindings()


# █▀▀ █▀█ █▀█ █░█ █▀█ █▀
# █▄█ █▀▄ █▄█ █▄█ █▀▀ ▄█

groups = [Group(f"{i+1}", label="⬤") for i in range(9)] #Be careful modifying this, otherwise qtile config will break

for i in groups:
    keys.extend(
        [
            Key(
                [Keys.windows],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
                ),
            Key(
                [Keys.windows, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
                ),
            ]
    )



#layout
layouts = [
    layout.Plasma(
        margin = 0,
        border_focus = Colors.Border_Focused,
        border_normal = Colors.Border_Normal,
        border_width = 2,
    )
]


widget_defaults = dict(
    font = "sans",
    fontsize = 12,
    padding = 4,
)

extension_defaults = widget_defaults.copy()


def open_launcher():
    qtile.cmd_spawn("rofi -theme rounded-green-dark -show drun")

#Topbar
screens = ScreenConfig()

# Drag floating layouts.
mouse = [
    Drag([Keys.windows], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([Keys.windows], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([Keys.windows], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False #This basically puts your mouse in the center on the screen after you switch to another workspace
floating_layout = layout.Floating(
	border_focus=Colors.Border_Focused,
	border_normal=Colors.Border_Normal,
	border_width=3,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)

from libqtile import hook
# some other imports
import os
import subprocess
# stuff
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/scripts/autostart.sh')
    subprocess.call([home])

auto_fullscreen = True
focus_on_window_activation = "smart" #or focus
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits
wmname = "LG3D"
