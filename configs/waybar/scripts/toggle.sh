#!/bin/bash
if [ "$#" = 0 ]; then
  echo Usage: "$0" PROGRAM "[...ARGS]"
  exit 1
fi

pkill "$1" || "$@"
