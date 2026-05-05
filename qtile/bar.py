from libqtile import bar, widget
from libqtile.lazy import lazy

from colors import Colors
from globals import fontname


battery-widget = widget.Battery(
    background=Colors.purple,
    charge_char='~',
    charging_background=Colors.yellow,
    discharge_char='',
    format='{char}{percent:2.0%}',
    low_background=Colors.red
    font=fontname
),

cpu-widget=widget.CPU(
    background=Colors.green,
    font=fontname,
    format='CPU {load_percent}%'
)

groupbox-widget = widget.GroupBox(
    active=Colors.cyan,
    font=fontname,
)

capslock-widget=widget.CapsNumLockIndicator(
)

clock-widget=widget.Clock(
    background=Colors.background,
    font=fontname,
    format='%d/%m/%y %H:%M'
)

memory-widget=widget.Memory(
    font=fontname,
    background=Colors.purple,
    format='RAM {MemPercent}%'
)

wlan-widget=widget.Wlan(
    font=fontname,
    background=Colors.green,
    format='{essid} {percent:2.0%}'
)

thermal-widget=widget.ThermalZone(
    font=fontname,
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
