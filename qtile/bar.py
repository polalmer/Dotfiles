from libqtile import widget
from libqtile.bar import Bar, STRETCH

from colors import Colors
from globals import fontname


battery_widget = widget.Battery(
    background=Colors.purple,
    charge_char='~',
    charging_background=Colors.yellow,
    discharge_char='',
    format='{char}{percent:2.0%}',
    low_background=Colors.red,
    font=fontname
)

cpu_widget=widget.CPU(
    background=Colors.green,
    font=fontname,
    format='CPU {load_percent}%'
)

groupbox_widget = widget.GroupBox(
    active=Colors.cyan,
    font=fontname,
)

capslock_widget=widget.CapsNumLockIndicator(
    font=fontname
)

clock_widget=widget.Clock(
    background=Colors.background,
    font=fontname,
    format='%d/%m/%y %H:%M'
)

memory_widget=widget.Memory(
    font=fontname,
    background=Colors.purple,
    format='RAM {MemPercent}%'
)

wlan_widget=widget.Wlan(
    font=fontname,
    background=Colors.green,
    format='{essid} {percent:2.0%}'
)
thermal_widget=widget.ThermalZone(
    font=fontname,
)


topBar = Bar(
    widgets =[
        capslock_widget,
        groupbox_widget,
        widget.Prompt(),
        widget.WindowName(),
        widget.Spacer(STRETCH),
        cpu_widget,
        thermal_widget,
        memory_widget,
        wlan_widget,
        battery_widget,
        clock_widget,
        widget.QuickExit(),
    ],
    size=30
)
