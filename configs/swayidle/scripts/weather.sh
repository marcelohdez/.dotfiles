#!/bin/sh
sleep 10
FORECAST=$(curl 'wttr.in/?format=2')

if [[ $? == 0 ]]; then
	notify-send -t 10000 "Current forecast" "$FORECAST"
fi
