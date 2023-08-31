#!/bin/sh
killall waybar
# kill all remaining waybar scripts
for pid in $(ps -A -O 'sid' | grep 'python3.*waybar' | head -n -1 | awk '{print $1}'); do
	echo $pid
	kill -9 $pid
done
# resummon from hyprland
hyprctl dispatch exec waybar
