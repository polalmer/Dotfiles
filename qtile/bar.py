from libqtile import bar, widget
from libqtile.lazy import lazy

topBar = bar.Bar(
    [
        widget.GroupBox(),
        widget.Prompt(),
        widget.WindowName(),
        widget.Clock(format="%d-%m-%Y %H:%M:%S"),
    ],
    24,
)
