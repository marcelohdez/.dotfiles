#!/bin/sh
# One-shot brightness setting script, for when waking up laptop in new room

# max my sensor can go up to (putting phone flash up to it)
MAX=3355
# max brightness can go up to
MAX_BR=$(brightnessctl m)
# minimum cause sensor reports 0 even in dimly lit areas
MIN_BR=$((MAX_BR / 33))

if ! illum=$(cat /sys/bus/iio/devices/iio:device0/in_illuminance_raw); then
  exit 1
fi

# https://easings.net/#easeOutCirc
amount=$(echo "scale=3; sqrt(1-(($illum / $MAX - 1)^2)) * $MAX_BR" | bc | cut -d. -f1)
if [ "$amount" -lt $MIN_BR ]; then amount=$MIN_BR; fi

brightnessctl set "$amount" -q
