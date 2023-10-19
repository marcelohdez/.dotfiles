#!/bin/sh
BATDIR=/sys/class/power_supply
AC=$(ls $BATDIR | grep -i 'ac$')

if [[ $(cat "$BATDIR/$AC/online") != '0' ]]; then exit 1; fi
