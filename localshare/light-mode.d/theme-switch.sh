#!/bin/sh
~/.local/share/both-modes.d/symlink_theme.sh zathura light rc
~/.local/share/both-modes.d/symlink_theme.sh fuzzel light ini
~/.local/share/both-modes.d/symlink_theme.sh foot light ini

# make any running instances light
pkill -SIGUSR2 foot

~/.local/share/both-modes.d/rand_wall.sh light
# accent color handled by rand_wall

~/.local/share/both-modes.d/set_gtk_theme.sh Adwaita default
