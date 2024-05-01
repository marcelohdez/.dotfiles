#!/bin/sh
LEVEL_LOW=20
LEVEL_CRITICAL=10
DELAY=120

LOCK_LOW='/tmp/lowbatlock'
LOCK_CRITICAL='/tmp/criticalbatlock'

if [ $# = 0 ]; then
	echo Current values: low=$LEVEL_LOW% critical=$LEVEL_CRITICAL%
	echo Usage: "$0" '<DEVICE>' '[OPTIONS]'
	echo Options: -e exit if battery not found
	echo
	echo e.g. for /sys/class/power_supply/BAT1/ the device is BAT1.
	exit 1
fi

while true; do
	if ! CHARGE=$(cat /sys/class/power_supply/"$1"/capacity); then
		if [ "$2" = '-e' ]; then exit 1; fi

		echo failed to cat device "$1"? Retrying in "$DELAY" seconds.
		sleep $DELAY
		continue
	fi

	# remove lockfiles if charging
	if ! ~/.local/share/fn-scripts/off_wall.sh; then
		rm "$LOCK_CRITICAL" "$LOCK_LOW"
		sleep $DELAY
		continue
	fi

	# check if charge is <= critical or <= low and if so, notify and write lockfile,
	# otherwise erase lockfiles
	if [ "$CHARGE" -le "$LEVEL_CRITICAL" ]; then
		if ! [ -f "$LOCK_CRITICAL" ]; then
			notify-send 'Critical battery level' \
				"Battery at $CHARGE%, this device will turn off soon." \
				-u critical

			touch "$LOCK_CRITICAL"
		fi
	elif [ "$CHARGE" -le "$LEVEL_LOW" ]; then
		if ! [ -f "$LOCK_LOW" ]; then
			notify-send 'Low battery level' \
				"Battery at $CHARGE%, charge this device soon." \
				-t 20000

			touch "$LOCK_LOW"
		fi
	else
		rm "$LOCK_CRITICAL" "$LOCK_LOW"
	fi

	sleep $DELAY
done
