#!/bin/sh
SCREEN_CAP=$(pw-dump | grep -m 1 'xdg-desktop-portal-hyprland:capture' -c)

CLASS="off" && [[ $SCREEN_CAP != "0" ]] && CLASS="on"
PERCENT=0 && [[ $CLASS == "on" ]] && PERCENT=100

printf "{\"tooltip\":\"Screensharing is $CLASS.\",\"percentage\":$PERCENT,\"class\":\"$CLASS\"}\n"
