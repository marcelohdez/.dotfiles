#!/bin/sh
if [ "$#" != 1 ]; then
  echo "Usage: $0 LID"
  echo To find lid identifier, see /proc/acpi/button/lid/
  exit
fi

outputs=$(swaymsg -t get_outputs | jq -r length)
case $(awk '{print $2}' </proc/acpi/button/lid/"$1"/state) in
'closed')
  if [ "$outputs" -gt 1 ]; then
    swaymsg output eDP-1 disable
  else
    systemctl suspend
  fi
  ;;
'open')
  swaymsg output eDP-1 enable

  # set close-enough brightness
  ~/.local/share/fn-scripts/auto_brightness.sh
  ;;
esac
