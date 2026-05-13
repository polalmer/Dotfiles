import subprocess

from libqtile.command.base import expose_command
from libqtile.widget import base


class Shutdown(base._TextBox):

    def __init__(self, **config):
        super().__init__("", **config)
        self.add_defaults(Shutdown.defaults)
        self.add_callbacks({"Button1": self.trigger})


    @expose_command()
    def trigger(self):
        subprocess.run(["sudo poweroff"])
