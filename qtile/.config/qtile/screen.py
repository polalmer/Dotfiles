from libqtile import bar, widget, qtile
from libqtile.config import Screen
from statics import Colors

def open_btop():
    qtile.cmd_spawn("alacritty --hold -e btop")

def ScreenConfig():
    return [
        Screen(
            top=bar.Bar(
                [
                    widget.GroupBox(
                        fontsize=16,
                        borderwidth=0,
                        highlight_method='block',
                        active='#56D9C7',  #Active workspaces circle color
                        block_highlight_text_color="#00F076",  #Current workspace circle color
                        highlight_color='#4B427E',
                        inactive='#052A25',  #Empty workspace circle
                        foreground=Colors.Bar_Background,
                        background=Colors.Bar_Background,
                        this_current_screen_border='#00361A',  #Circle background color
                        this_screen_border='#52548D',
                        other_current_screen_border='#52548D',
                        other_screen_border='#52548D',
                        urgent_border='#52548D',
                        rounded=True,
                        disable_drag=True,
                    ),

                    widget.CPU(
                        font="IBM Plex Mono Medium",
                        format='CPU:({load_percent:.1f}%/{freq_current}GHz)',
                        fontsize=15,
                        margin=0,
                        padding=0,
                        background=Colors.Bar_Background,
                        mouse_callbacks={'Button1': open_btop},
                    ),

                    widget.Systray(
                        background=Colors.Bar_Background,
                        icon_size=24,
                        padding=3,
                    ),

                    widget.PulseVolume(
                        font='IBM Plex Mono Medium',
                        fontsize=15,
                        padding=0,
                        background=Colors.Bar_Background,
                    ),

                    widget.Clock(
                        format='%d/%m/%y ',
                        background=Colors.Bar_Background,
                        font="IBM Plex Mono Medium",
                        fontsize=15,
                        padding=0,
                    ),

                    widget.Clock(
                        format='%H:%M',
                        background=Colors.Bar_Background,
                        font="IBM Plex Mono Medium",
                        fontsize=15,
                        padding=0,
                    ),
                ],
                30,  # Bar size (all axis)
                margin=[0, 8, 6, 8]  # Bar margin (Top,Right,Bottom,Left)
            ),
            wallpaper='~/.config/qtile/Wallpaper/background.jpg',
            wallpaper_mode="fill",
        )
    ]
