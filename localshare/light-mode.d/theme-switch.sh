#!/bin/sh
~/.local/share/both-modes.d/symlink_theme.sh zathura light rc
~/.local/share/both-modes.d/symlink_theme.sh foot light ini

~/.local/share/both-modes.d/rand_wall.sh light
~/.local/share/both-modes.d/borders.sh light

~/.local/share/both-modes.d/set_gtk_theme.sh Adwaita light
makoctl mode -a light 1>/dev/null && makoctl reload
