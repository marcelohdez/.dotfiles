#!/bin/sh
killall waybar
# kill all remaining waybar scripts in ~/.config/waybar/scripts/*
for pid in $(ps -e -O pid | grep waybar/scripts | head -n -1 | awk '{print $1}'); do
	kill "$pid"
done

swaymsg exec waybar 1>/dev/null
