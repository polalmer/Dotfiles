from libqtile import bar, widget, qtile
from libqtile.config import Screen
from statics import Colors


def open_btop():
    qtile.cmd_spawn("alacritty --hold -e btop")


def GroupBoxWidget():
    return widget.GroupBox(
        fontsize=16,
        borderwidth=0,
        highlight_method='block',
        active='#56D9C7',  #Active workspaces circle color
        block_highlight_text_color="#00F076",  #Current workspace circle color
        highlight_color='#4B427E',
        inactive='#052A25',  #Empty workspace circle
        foreground=Colors.Bar_Background,
        background=Colors.Bar_Background,
        this_current_screen_border=Colors.Border_Focused,  #Circle background color
        this_screen_border=Colors.Border_Normal,
        other_current_screen_border=Colors.Border_Normal,
        other_screen_border=Colors.Border_Normal,
        urgent_border=Colors.Border_Normal,
        rounded=True,
        disable_drag=True,
    )


def CpuWidget():
    return widget.CPU(
        font="IBM Plex Mono Medium",
        format='CPU:({load_percent:.1f}%/{freq_current}GHz)',
        fontsize=15,
        margin=0,
        padding=0,
        background=Colors.Bar_Background,
        mouse_callbacks={'Button1': open_btop},
    )


def SystrayWidget():
    return widget.Systray(
        background=Colors.Bar_Background,
        icon_size=24,
        padding=3,
    )


def VolumeWidget():
    return widget.PulseVolume(
        font='IBM Plex Mono Medium',
        fontsize=15,
        padding=0,
        background=Colors.Bar_Background,
        emoji=True
    )


def ClockWidget():
    return (
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
        )
    )


def TopBar() -> bar.Bar:
    return bar.Bar([
        GroupBoxWidget(),
        widget.Spacer(length=bar.STRETCH),
        CpuWidget(),
        SystrayWidget(),
        VolumeWidget(),
        *ClockWidget()
    ],
        30,  # Bar size (all axis)
        margin=[0, 0, 6, 0]  # Bar margin (Top,Right,Bottom,Left)
    )


def ScreenConfig():
    return [
        Screen(
            top=TopBar(),
            wallpaper='~/.config/qtile/Wallpaper/background.jpg',
            wallpaper_mode="fill",
        )
    ]
