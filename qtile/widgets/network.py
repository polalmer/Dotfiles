import subprocess
import shlex

from libqtile.widget import base


class Network(base.ThreadPoolText):
    """Show current NetworkManager status."""

    defaults = [
        ("update_interval", 2, "Update interval in seconds."),
        (
            "cmd",
            ["nmcli", "-t", "-f", "TYPE,STATE,CONNECTION", "device"],
            "Command used to get network status.",
        ),
        ("fallback_text", "Offline", "Text shown when no active connection exists."),
        ("applet_cmd", "nm-applet", "Command run when the widget is left-clicked."),
    ]

    def __init__(self, **config):
        super().__init__("", **config)
        self.add_defaults(Network.defaults)

    def _parse(self, raw: str) -> str:
        for line in raw.splitlines():
            parts = line.strip().split(":", 2)
            if len(parts) != 3:
                continue
            dev_type, state, connection = parts
            if state != "connected" or not connection or connection == "--":
                continue
            if dev_type == "wifi":
                return f"\uf1eb: {connection}"
            if dev_type == "ethernet":
                return f"\udb80\ude00: {connection}"
            return f"{dev_type.capitalize()}: {connection}"
        return self.fallback_text

    def poll(self):
        try:
            raw = subprocess.check_output(self.cmd, text=True)
        except (subprocess.CalledProcessError, FileNotFoundError):
            return self.fallback_text
        return self._parse(raw)

    def button_press(self, x, y, button):
        super().button_press(x, y, button)
        if button != 1:
            return
        try:
            subprocess.Popen(shlex.split(self.applet_cmd))
        except (FileNotFoundError, PermissionError):
            return
