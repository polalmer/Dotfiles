from libqtile import widget
from libqtile.bar import Bar, STRETCH

from colors import Colors
from globals import fontname
from widgets.caps import Caps
from widgets.network import Network

_barSize = 30
_padding = 5
_fontsize = 14

def leftEnd(leftColor, rightColor) -> widget.TextBox:
    return widget.TextBox(
        text='\ue0be',
        padding=0,
        fontsize=_barSize+2,
        background=leftColor,
        foreground=rightColor
    )

battery_widget = widget.Battery(
    charge_char='~',
    discharge_char='',
    format='\udb80\udc79: {percent:2.0%}',
    background = Colors.batteryW,
    foreground = Colors.black,
    padding=_padding,
    fontsize=_fontsize
)

cpu_widget=widget.CPU(
    font=fontname,
    foreground=Colors.black,
    background=Colors.cpuW,
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
    background=Colors.clockW,
    padding=_padding,
    fontsize=_fontsize
)

memory_widget=widget.Memory(
    font=fontname,
    foreground=Colors.white,
    background=Colors.memoryW,
    format='\uefc5: {MemPercent}%',
    padding=_padding,
    fontsize=_fontsize
)

exit_widget=widget.QuickExit(
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
    background=Colors.networkW,
    foreground=Colors.black,
    padding=_padding,
    fontsize=_fontsize
)


topBar = Bar(
    widgets =[
        caps_widget,
        groupbox_widget,
        widget.Spacer(STRETCH),
        leftEnd(None,Colors.cpuW),
        cpu_widget,
        leftEnd(Colors.cpuW,Colors.memoryW),
        memory_widget,
        leftEnd(Colors.memoryW,Colors.batteryW),
        battery_widget,
        leftEnd(Colors.batteryW,Colors.networkW),
        network_widget,
        leftEnd(Colors.networkW,Colors.clockW),
        clock_widget,
        leftEnd(Colors.clockW,Colors.exitW),
        exit_widget,
    ],
    size=_barSize
)
