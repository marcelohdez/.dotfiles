#!/bin/sh
# If editing, ensure filename matches xdg-desktop-portal-wlr/config!
CLASS="off" && test -f /tmp/xdp_screenrec && CLASS="on"
PERCENT=0 && [[ $CLASS == "on" ]] && PERCENT=100

printf "{\"tooltip\":\"Screensharing is $CLASS.\",\"percentage\":$PERCENT,\"class\":\"$CLASS\"}\n"
