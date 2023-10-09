#!/bin/sh
if [[ $# == 0 ]]; then
	echo 'Usage: $0 <plus symbol or minus symbol> [percent]'
	exit
fi

PERCENT=$(source ~/.local/share/fn-scripts/get_vol_percent.sh)
CHANGE=$(if [[ $2 != '' ]]; then echo $1$2; else echo $1'5'; fi)
NEW_PERCENT=$(($PERCENT + $CHANGE))

if [ $NEW_PERCENT -gt 100 ]; then
	pactl set-sink-volume @DEFAULT_SINK@ 1.0
else
	pactl set-sink-volume @DEFAULT_SINK@ $CHANGE'%'
fi
