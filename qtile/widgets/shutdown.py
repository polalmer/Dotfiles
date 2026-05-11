import subprocess

from libqtile.command.base import expose_command
from libqtile.widget import base


class Shutdown(base._TextBox):

    defaults = [
        ("poweroff", ["sudo poweroff"], "turn off the system"),
    ]

    def __init__(self, **config):
        super().__init__("", **config)
        self.add_defaults(Shutdown.defaults)

    @expose_command()
    def trigger(self):
        subprocess.run(self.poweroff)       
