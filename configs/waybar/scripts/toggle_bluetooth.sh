#!/bin/sh
STATUS=$(bluetoothctl show | grep PowerState | cut -d' ' -f 2)

if [[ $STATUS == "off" ]]; then
	bluetoothctl power on
	notify-send Bluetooth Enabled
else
	bluetoothctl power off
	notify-send Bluetooth Disabled
fi
