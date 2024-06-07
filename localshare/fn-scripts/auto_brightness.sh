#!/bin/sh
# max my sensor can go up to (putting phone flash up to it)
MAX=3355
# max brightness can go up to
MAX_BR=$(brightnessctl m)
# minimum cause sensor reports 0 even in dimly lit areas
MIN_BR=$((MAX_BR / 33))
# re-calculation threshold when brightness is changed manually
THRESHOLD=$((MAX_BR / 10))
# delay between checks
DELAY=4
# start with double max to always update
last_amount=$((MAX_BR * 2))

while true; do
	if ! illum=$(cat /sys/bus/iio/devices/iio:device0/in_illuminance_raw); then
		exit 1
	fi

	# https://easings.net/#easeOutCirc
	amount=$(echo "scale=3; sqrt(1-(($illum / $MAX - 1)^2)) * $MAX_BR" | bc | cut -d. -f1)
	if [ "$amount" -lt $MIN_BR ]; then amount=$MIN_BR; fi

	threshold=0
	if cat /tmp/brightnesslock 2>/dev/null; then
		threshold=$THRESHOLD
	fi

	change=$((amount - last_amount))
	if [ "${change#-}" -gt "$threshold" ]; then
		last_amount=$amount
		rm /tmp/brightnesslock 2>/dev/null
		brightnessctl set "$last_amount" -q
	fi

	sleep "$DELAY"
done
