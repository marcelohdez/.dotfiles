#!/bin/sh
LEVEL_LOW=20
LEVEL_CRITICAL=10
DELAY=120

LOCK_LOW='/tmp/lowbatlock'
LOCK_CRITICAL='/tmp/criticalbatlock'

if [ $# = 0 ]; then
	echo Current values: low=$LEVEL_LOW% critical=$LEVEL_CRITICAL%
	echo Usage: "$0" '<DEVICE>'
	echo e.g. for /sys/class/power_supply/BAT1, device is BAT1.
	exit 1
fi

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
			response=$(notify-send 'Critical battery level' \
				"Battery at $CHARGE%, this device will turn off soon.\nRich-click to enable power-saver" \
				-A 'default=Enable power-saver mode' \
				-u critical)

			touch "$LOCK_CRITICAL"
		elif ! [ -f "$LOCK_LOW" ]; then
			response=$(notify-send 'Low battery level' \
				"Battery at $CHARGE%, charge this device soon.\nRight-click to enable power-saver" \
				-A 'default=Enable power-saver mode' \
				-t 30000)

			touch "$LOCK_LOW"
		fi

		if [ "$response" = 'default' ]; then powerprofilesctl set power-saver; fi
	else
		rm "$LOCK_CRITICAL" "$LOCK_LOW"
	fi

	sleep $DELAY
done
