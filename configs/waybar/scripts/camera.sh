#!/bin/sh
CAMS=$(ls /dev/video*)
if [[ $? != 0 ]]; then exit; fi
CLASS="off"

ALLOWED="wireplumber pipewire"
while read line; do
  for p in $(lsof $line | tail -n +2 | cut -d' ' -f 1); do
    if [[ $(echo $ALLOWED | grep -c -w $p) == '0' ]]; then
      CLASS="on"
      break
    fi
  done
done <<<$CAMS

PERCENT=0 && [[ $CLASS == "on" ]] && PERCENT=100
printf "{\"tooltip\":\"Camera is $CLASS\",\"percentage\":$PERCENT,\"class\":\"$CLASS\"}\n"
