#!/bin/sh
STATE_FILE=/tmp/lid_state
OUTPUTNUM=$(swaymsg -t get_outputs | jq -r length)

state="$1"
if [ "$state" = '' ]; then
  state=$(cat /tmp/lid_state)
fi

case "$state" in
'on') # closed
  if [ "$OUTPUTNUM" -gt 1 ]; then
    swaymsg output eDP-1 disable
  else
    systemctl suspend
  fi

  echo "$state" >"$STATE_FILE"
  ;;
'off') # open
  swaymsg output eDP-1 enable

  echo "$state" >"$STATE_FILE"
  ;;
esac
