# Antonio Sarosi
# https://youtube.com/c/antoniosarosi
# https://github.com/antoniosarosi/dotfiles

# Qtile workspaces

from libqtile.command import lazy
from libqtile.config import Group, Key

from .keys import keys, mod

# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)
# Icons:
# nf-fa-firefox,
# nf-fae-python,
# nf-dev-terminal,
# nf-fa-code,
# nf-oct-git_merge,
# nf-linux-docker,
# nf-mdi-image,
# nf-mdi-layers

groups = [
    Group(i)
    for i in [
        "   ",
        "   ",
        "   ",
        "   ",
        " ﭮ  ",
    ]
]
top_row = [
    "quotedbl",
    "guillemotleft",
    "guillemotright",
    "parenleft",
    "parenright",
    "at",
    "plus",
    "minus",
    "asterisk",
]


for i, group in enumerate(groups):
    actual_key = top_row[i]
    keys.extend(
        [
            # Switch to workspace N
            Key([mod], actual_key, lazy.group[group.name].toscreen()),
            # Send window to workspace N
            Key([mod, "shift"], actual_key, lazy.window.togroup(group.name)),
        ]
    )
