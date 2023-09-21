#!/bin/sh
killall waybar
# kill all remaining waybar scripts
for pid in $(ps -A -O 'sid' | grep 'python3.*waybar' | head -n -1 | awk '{print $1}'); do
	echo $pid
	kill -9 $pid
done
# resummon from hyprland or normally if not possible
HYPRCTL_OUT=$(hyprctl dispatch exec waybar)

if [[ $HYPRCTL_OUT != 'ok' ]]; then
	SWAY_SOCKET=$(source $HOME/.local/share/both-modes.d/get_sway_socket.sh)
	swaymsg -s $SWAY_SOCKET exec waybar
fi
