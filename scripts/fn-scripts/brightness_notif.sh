#!/bin/bash
VAL=$(($(($2 * 10)) / $3))
icons=( 󱩎 󱩏 󱩐 󱩑 󱩒 󱩓 󱩔 󱩕 󱩖 󰛨)

~/.local/share/fn-scripts/bar_notif.sh "${icons[$VAL]} Brightness" "$1" $2 $3
