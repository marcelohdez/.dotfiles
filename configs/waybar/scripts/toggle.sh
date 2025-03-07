#!/bin/sh
if [ "$#" = 0 ]; then
  echo Usage: "$0" PROGRAM "[...ARGS]"
  exit 1
fi

if pgrep "$1"; then
  killall "$1"
else
  "$@"
fi
