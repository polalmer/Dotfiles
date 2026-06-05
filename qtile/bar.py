from libqtile import widget
from libqtile.bar import Bar, STRETCH

from colors import Colors
from globals import Globals
from widgets import Network, Caps, Shutdown

padding = 14
fontsize = 14

def battery_widget():
    return widget.Battery(
            charge_char='~',
            discharge_char='',
            format='\udb80\udc79: {percent:2.0%}',
            foreground = Colors.batteryW,
            padding=padding,
            fontsize=fontsize
            )

def cpu_widget():
    return widget.CPU(
            font=Globals.fontname,
            foreground=Colors.cpuW,
            format='\uf4bc: {load_percent}%',
            padding=padding,
            fontsize=fontsize
            )

def groupbox_widget():
    return widget.GroupBox(
            highlight_method="text",
            hide_unused=False,
            active="#6b6b6b",
            inactive="#6b6b6b",
            this_current_screen_border=Colors.orange,
            this_screen_border="#6b6b6b",
            other_current_screen_border=None,
            other_screen_border=None,
            font=Globals.fontname,
            padding=padding,
            fontsize=fontsize
            )

def clock_widget():
    return widget.Clock(
            font=Globals.fontname,
            format='%d/%m/%y %H:%M',
            foreground=Colors.clockW,
            padding=padding,
            fontsize=fontsize
            )

def memory_widget():
    return widget.Memory(
            font=Globals.fontname,
            foreground=Colors.memoryW,
            format='\uefc5: {MemPercent}%',
            padding=padding,
            fontsize=fontsize
            )

def shutdown_widget():
    return Shutdown(
            default_text="\uf011",
            background=Colors.exitW,
            padding=padding,
            fontsize=fontsize
            )

def caps_widget():
    return Caps(
            background=Colors.red,
            font=Globals.fontname,
            padding=padding,
            fontsize=fontsize
            )

def network_widget():
    return Network(
            font=Globals.fontname,
            foreground=Colors.black,
            padding=padding,
            fontsize=fontsize
            )


def LaptopBar() -> Bar:
    return Bar(
            widgets =[
                caps_widget(),
                groupbox_widget(),
                widget.Spacer(STRETCH),
                cpu_widget(),
                memory_widget(),
                battery_widget(),
                network_widget(),
                clock_widget(),
                shutdown_widget(),
                ],
            size=10,
            opacity=0.5
            )

def MonitorBar() -> Bar:
    return Bar(
       widgets =[
                caps_widget(),
                groupbox_widget(),
                widget.Spacer(STRETCH),
                cpu_widget(),
                memory_widget(),
                network_widget(),
                clock_widget(),
                shutdown_widget(),
                ],
            size=12,
            opacity=0.5
            )
            
