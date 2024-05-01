#!/bin/sh
killall waybar
swaymsg exec waybar 1>/dev/null
