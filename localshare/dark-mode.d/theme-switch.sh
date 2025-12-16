#!/bin/sh
~/.local/share/both-modes.d/symlink_theme.sh zathura dark rc
~/.local/share/both-modes.d/symlink_theme.sh fuzzel dark ini
~/.local/share/both-modes.d/symlink_theme.sh foot dark ini

# make any running foot instances dark
pkill -SIGUSR1 foot

~/.local/share/both-modes.d/rand_wall.sh dark
# accent color handled by rand_wall

~/.local/share/both-modes.d/set_gtk_theme.sh Adwaita-dark prefer-dark
