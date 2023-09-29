#!/bin/sh
killall waybar
# kill all remaining waybar scripts in ~/.config/waybar/scripts/*
for pid in $(ps -e -O pid | grep waybar/scripts | head -n -1 | awk '{print $1}'); do
	kill $pid
done
# resummon from hyprland or normally if not possible
HYPRCTL_OUT=$(hyprctl dispatch exec waybar)

if [[ $HYPRCTL_OUT != 'ok' ]]; then
	SWAY_SOCKET=$(source $HOME/.local/share/both-modes.d/get_sway_socket.sh)
	swaymsg -s $SWAY_SOCKET exec waybar
fi
