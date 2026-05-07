import re
import subprocess

from libqtile.widget import base


class Caps(base.InLoopPollText):
    """Show lock-state indicators for Caps Lock and Num Lock."""

    defaults = [
        ("update_interval", 0.5, "Update interval in seconds."),
        ("cmd", ["xset", "q"], "Command used to get keyboard lock state."),
    ]

    def __init__(self, **config):
        super().__init__("", **config)
        self.add_defaults(Caps.defaults)

    @staticmethod
    def _parse(raw: str) -> str:
        if raw.startswith("Keyboard"):
            indicators = dict(re.findall(r"(Caps|Num)\s+Lock:\s*(\w*)", raw))
            glyphs = []
            if indicators.get("Caps", "").lower() == "on":
                glyphs.append("\udb82\ude9b")
            if indicators.get("Num", "").lower() == "on":
                glyphs.append("N")
            return " ".join(glyphs)
        return ""

    def poll(self):
        try:
            raw = subprocess.check_output(self.cmd, text=True)
        except (subprocess.CalledProcessError, FileNotFoundError):
            return ""
        return self._parse(raw)
