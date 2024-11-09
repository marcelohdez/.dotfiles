#!/bin/sh
~/.local/share/both-modes.d/symlink_theme.sh zathura dark rc
~/.local/share/both-modes.d/symlink_theme.sh foot dark ini
~/.local/share/both-modes.d/symlink_theme.sh 'ags/style' dark scss

~/.local/share/both-modes.d/rand_wall.sh dark

~/.local/share/both-modes.d/set_gtk_theme.sh Adwaita-dark prefer-dark
makoctl mode -r light 1>/dev/null && makoctl reload
