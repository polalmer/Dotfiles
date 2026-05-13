import subprocess

from libqtile.command.base import expose_command
from libqtile.lazy import lazy
from libqtile.widget import base


class Network(base.ThreadPoolText):

    defaults = [
        ("update_interval", 2, "Update interval in seconds."),
    ]

    def __init__(self, **config):
        super().__init__("", **config)
        self.add_defaults(Network.defaults)
        self.add_callbacks({"Button1": self.trigger})

    def getNetworkMangerStatus(self) -> str:

        nm_command = ["nmcli", "-t", "-f", "TYPE,STATE,CONNECTION", "device"]
        raw = subprocess.check_output(nm_command, text=True)

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

    #override the existing poll method
    def poll(self) -> str:
        return self.getNetworkMangerStatus()

    @expose_command()
    def trigger(self):
        lazy.spawn('nm-applet')
