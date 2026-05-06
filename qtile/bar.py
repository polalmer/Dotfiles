from libqtile import widget
from libqtile.bar import Bar, STRETCH

from colors import Colors
from globals import fontname


battery_widget = widget.Battery(
    background=Colors.primary,
    charge_char='~',
    charging_background=Colors.orange,
    discharge_char='',
    format='{char}{percent:2.0%}',
    low_background=Colors.red,
)

cpu_widget=widget.CPU(
    background=Colors.primary,
    font=fontname,
    format='CPU {load_percent}%'
)

groupbox_widget = widget.GroupBox(
    background=Colors.background,
    active=Colors.primary,
    font=fontname,
)

capslock_widget=widget.CapsNumLockIndicator(
    font=fontname
)

clock_widget=widget.Clock(
    background=Colors.secondary,
    font=fontname,
    format='%d/%m/%y %H:%M'
)

memory_widget=widget.Memory(
    font=fontname,
    background=Colors.primary,
    format='RAM {MemPercent}%'
)

wlan_widget=widget.Wlan(
    font=fontname,
    background=Colors.secondary,
    format='{essid} {percent:2.0%}'
)
thermal_widget=widget.ThermalZone(
    font=fontname,
    background=Colors.secondary,
)

exit_widget=widget.QuickExit(
    background=Colors.red,
    font=fontname,
)

topBar = Bar(
    widgets =[
        capslock_widget,
        groupbox_widget,
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
