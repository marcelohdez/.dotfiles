#!/bin/sh
if [ $# != 0 ]; then
  echo Exits with either 1 if connected to wall or 0 if not.
  echo e.g.: "$0" "&&" echo im off wall
  exit 2
fi

# find first power supply with ac in name
AC=$(find /sys/class/power_supply -maxdepth 1 | grep -i 'ac' | head -1)

if [ "$(cat "$AC/online")" != '0' ]; then
  exit 1
fi
