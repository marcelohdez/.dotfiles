#!/bin/sh
if [[ $# != 1 ]]; then
	echo This script will check if any instances of the given process exist,
	echo and if so, it will kill them. Otherwise, it\'ll create a new one.
	printf "\tUsage: $0 <process>\n"
	exit 1
fi

PROC=$(pgrep $1)
if [[ $PROC == '' ]]; then
	$1
else
	for pid in $PROC; do
		kill $pid
	done
fi
