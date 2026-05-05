from libqtile import bar, widget
from libqtile.lazy import lazy

from colors import Colors
from globals import font


battery-widget = widget.Battery(
    background=Colors.purple,
    charge_char='~',
    charging_background=Colors.yellow,
    discharge_char='',
    format='{char}{percent:2.0%}',
    low_background=Colors.red
    font=font
),

cpu-widget=widget.CPU(
    background=Colors.green,
    font=font,
    format='CPU {load_percent}%'
)

groupbox-widget = widget.GroupBox(
    active=Colors.cyan,
    font=font,
)

capslock-widget=widget.CapsNumLockIndicator(
)

clock-widget=widget.Clock(
    background=Colors.background,
    font=font,
    format='%d/%m/%y %H:%M'
)

memory-widget=widget.Memory(
    font=font
    background=Colors.purple,
    format='RAM {MemPercent}%'
)

wlan-widget=widget.Wlan(
    font=font,
    background=Colors.green,
    format='{essid} {percent:2.0%}'
)

thermal-widget=widget.ThermalZone(
    font=font,
)

topBar = bar.Bar(
    [
        capslock-widget,
        groupbox-widget,
        widget.Prompt(),
        widget.WindowName(),
        widget.Spacer(bar.STRETCH),
        cpu-widget,
        thermal-widget,
        memory-widget,
        wlan-widget,
        battery-widget,
        clock-widget
    ],
    24,
)
