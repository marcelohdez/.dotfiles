#!/bin/sh
if [ $# != 1 ]; then
	echo Usage: "$0" '< *anything to get mode* | toggle >'
	exit 1
fi

MODE=dnd
class='off'
icon='󰂜'

if [ "$(makoctl mode | grep -c -m 1 "$MODE")" != '0' ]; then
	class='on'
	icon='󰪑'
fi

if [ "$1" = 'toggle' ]; then
	echo mode is now:

	case "$class" in
	'off')
		makoctl mode -a "$MODE"
		;;
	'on')
		makoctl mode -r "$MODE"
		;;
	esac

	# send 1 signal to reload dnd module
	pkill -RTMIN+1 waybar
else
	printf "%s\nDo not disturb is %s\n%s\n" "$icon" "$class" "$class"
fi
