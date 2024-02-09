#!/bin/sh
BATDIR=/sys/class/power_supply
AC=$(ls $BATDIR | grep -i 'ac$')

# INHIBIT_DIR set in .profile
if [ "$(cat "$BATDIR/$AC/online")" != '0' ]; then
	exit 1
fi
