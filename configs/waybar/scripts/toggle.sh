#!/bin/bash
if [ "$#" = 0 ]; then
  echo Usage: "$0" PROGRAM "[...ARGS]"
  exit 1
fi

# get only up to 15 characters
fullname="$1"
pname="${fullname:0:15}"

if pgrep "$pname"; then
  killall "$fullname"
else
  "$@"
fi
