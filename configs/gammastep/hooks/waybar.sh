#!/bin/sh
case $1 in
period-changed)
  echo "$3" >/tmp/gammastep-period
  pkill -RTMIN+2 waybar
  ;;
esac
