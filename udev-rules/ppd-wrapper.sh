#!/bin/sh
LOCKDIR=/tmp/ppdwrapperlock
if ! [ -f "$LOCKDIR" ]; then
	sleep 3
	touch "$LOCKDIR"
fi
powerprofilesctl "$@"
