from libqtile import widget
from libqtile.bar import Bar, STRETCH

from colors import Colors
from globals import fontname
from widgets.caps import Caps


battery_widget = widget.Battery(
    charge_char='~',
    charging_foreground=Colors.orange,
    discharge_char='',
    format='Battery: {percent:2.0%}',
    low_foreground=Colors.red,
)

cpu_widget=widget.CPU(
    foreground=Colors.cyan,
    font=fontname,
    format='CPU: {load_percent}%'
)

groupbox_widget = widget.GroupBox(
    highlight_method="block",
    hide_unused=True,
    highlight_color=[Colors.secondary],
    other_current_screen_border=None,
    other_screen_border=None,
    font=fontname
)

clock_widget=widget.Clock(
    foreground=Colors.foreground,
    font=fontname,
    format='%d/%m/%y %H:%M'
)

memory_widget=widget.Memory(
    font=fontname,
    foreground=Colors.primary,
    format='RAM: {MemPercent}%'
)

thermal_widget=widget.ThermalZone(
    font=fontname,
)

exit_widget=widget.QuickExit(
    foreground=Colors.foreground,
    default_text="⏻"
)

caps_widget=Caps(
    background=Colors.red,
    font=fontname,
)

topBar = Bar(
    widgets =[
        caps_widget,
        groupbox_widget,
        widget.Spacer(STRETCH),
        cpu_widget,
        thermal_widget,
        memory_widget,
        battery_widget,
        clock_widget,
        widget.QuickExit(),
    ],
    size=30
)
