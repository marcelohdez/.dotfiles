#!/bin/sh
if [ $# != 1 ] || [ "$1" != 'get' ] && [ "$1" != 'toggle' ]; then
  echo Usage: "$0" '< get | toggle >'
  exit 1
fi

class='off'
percentage=0

if [ "$(dunstctl get-pause-level)" != '0' ]; then
  class='on'
  percentage=100
fi

if [ "$1" = 'toggle' ]; then
  case "$class" in
  'off')
    dunstctl set-pause-level 50
    ;;
  'on')
    dunstctl set-pause-level 0
    ;;
  esac

  # send signal 1 to reload dnd module
  pkill -RTMIN+1 waybar
else
  printf "{\"tooltip\":\"Do not disturb is %s\",\"percentage\":%s,\"class\":\"%s\"}\n" "$class" "$percentage" "$class"
fi
