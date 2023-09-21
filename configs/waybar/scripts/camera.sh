#!/bin/sh
CAMS=$(ls /dev/video*)
if [[ $? != 0 ]]; then exit; fi
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
