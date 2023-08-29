#!/bin/sh
set -eo pipefail

CAMS=$(ls /dev/video*)
CLASS="off"

while read line; do
  NUM=$(lsof $line | wc -l)

  if [[ $NUM != "3" && $NUM != "0" ]]; then
    CLASS="on"
    break
  fi
done <<<$CAMS

PERCENT=0 && [[ $CLASS == "on" ]] && PERCENT=100

printf "{\"tooltip\":\"Camera is $CLASS\",\"percentage\":$PERCENT,\"class\":\"$CLASS\"}\n"
