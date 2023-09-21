#!/bin/sh
sleep 8
FORECAST=$(curl 'wttr.in/?format=2')

if [[ $? == 0 ]]; then
	notify-send -t 10000 "Current forecast" "$FORECAST"
else
	notify-send "Oops! Could not get forecast"
fi
