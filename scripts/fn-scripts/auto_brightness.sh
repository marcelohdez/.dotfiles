#!/bin/sh
MAX=550
MIN=10
last_amount=110

while true; do
	if ! illuminance=$(cat /sys/bus/iio/devices/iio:device0/in_illuminance_raw); then
		exit 1
	fi

	amount=100
	if [ "$illuminance" -lt $MAX ]; then
		if [ "$illuminance" -gt $MIN ]; then
			# use ease out sine function from https://easings.net/#easeOutSine
			amount=$(echo "(s((($illuminance / $MAX) * 3.14) / 2)) * 100" | bc -l | cut -d. -f1)
		else
			amount=3
		fi
	fi
	change=$((amount - last_amount))

	threshold=5
	if cat /tmp/brightnesslock; then
		threshold=10
	fi

	if [ "${change#-}" -gt $threshold ]; then
		last_amount=$amount
		rm /tmp/brightnesslock
		brightnessctl set "$amount"% -q
	fi

	sleep 10
done
