#!/bin/sh
THEME=$1
rm ~/.config/waybar/colors.css
ln -s "$HOME/.config/waybar/themes/$THEME.css" ~/.config/waybar/colors.css

. ~/.local/share/both-modes.d/reload_waybar.sh
