#!/bin/sh
LEVEL_LOW=20
LEVEL_CRITICAL=10
DELAY=120

if [ $# = 0 ]; then
  echo Current values: low=$LEVEL_LOW% critical=$LEVEL_CRITICAL% delay=$DELAY
  echo Usage: "$0" '<DEVICE>'
  echo e.g. for /sys/class/power_supply/BAT1, device is BAT1.
  exit 1
fi

LOCK_LOW='/tmp/lowbatlock'
LOCK_CRITICAL='/tmp/criticalbatlock'

while true; do
  if ! CHARGE=$(cat /sys/class/power_supply/"$1"/capacity); then
    exit 1
  fi

  # remove lockfiles if connected to the wall
  if ! ~/.local/share/fn-scripts/off_wall.sh; then
    rm "$LOCK_CRITICAL" "$LOCK_LOW"
    sleep $DELAY
    continue
  fi

  if [ "$CHARGE" -le "$LEVEL_LOW" ]; then
    if [ "$CHARGE" -le "$LEVEL_CRITICAL" ] && ! [ -f "$LOCK_CRITICAL" ]; then
      notify-send -u critical "Battery at $CHARGE%" "This device will turn off soon."

      touch "$LOCK_CRITICAL"
    elif ! [ -f "$LOCK_LOW" ]; then
      notify-send -u critical "Battery at $CHARGE%" "Charge this device soon."

      touch "$LOCK_LOW"
    fi

  else
    rm "$LOCK_CRITICAL" "$LOCK_LOW"
  fi

  sleep $DELAY
done
