from libqtile import widget
from libqtile.bar import Bar, STRETCH

from colors import Colors
from globals import fontname
from widgets import Network, Caps, Shutdown

_barSize = 30
_padding = 5
_fontsize = 14

battery_widget = widget.Battery(
    charge_char='~',
    discharge_char='',
    format='\udb80\udc79: {percent:2.0%}',
    foreground = Colors.batteryW,
    padding=_padding,
    fontsize=_fontsize
)

cpu_widget=widget.CPU(
    font=fontname,
    foreground=Colors.cpuW,
    format='\uf4bc: {load_percent}%',
    padding=_padding,
    fontsize=_fontsize
)

groupbox_widget = widget.GroupBox(
    highlight_method="text",
    hide_unused=False,
    active="#6b6b6b",
    inactive="#6b6b6b",
    this_current_screen_border=Colors.orange,
    this_screen_border="#6b6b6b",
    other_current_screen_border=None,
    other_screen_border=None,
    font=fontname,
    padding=_padding,
    fontsize=_fontsize
)

clock_widget=widget.Clock(
    font=fontname,
    format='%d/%m/%y %H:%M',
    foreground=Colors.clockW,
    padding=_padding,
    fontsize=_fontsize
)

memory_widget=widget.Memory(
    font=fontname,
    foreground=Colors.memoryW,
    format='\uefc5: {MemPercent}%',
    padding=_padding,
    fontsize=_fontsize
)

exit_widget=Shutdown(
    default_text="\uf011",
    background=Colors.exitW,
    padding=_padding,
    fontsize=_fontsize
)

caps_widget=Caps(
    background=Colors.red,
    font=fontname,
    padding=_padding,
    fontsize=_fontsize
)

network_widget=Network(
    font=fontname,
    foreground=Colors.black,
    padding=_padding,
    fontsize=_fontsize
)


topBar = Bar(
    widgets =[
        caps_widget,
        groupbox_widget,
        widget.Spacer(STRETCH),
        cpu_widget,
        memory_widget,
        battery_widget,
        network_widget,
        clock_widget,
        exit_widget,
    ],
    size=_barSize,
    opacity=0.5
)
