#!/bin/sh
if ! period=$(cat /tmp/gammastep-period); then
  period="none"
fi

percentage=100 && [ "$period" = "none" ] && percentage=0
class="on" && [ $percentage = 0 ] && class="off"

printf "{\"tooltip\":\"Toggle gammastep (currently %s).\",\"percentage\":%s,\"class\":\"%s\"}\n" \
  "$class" "$percentage" "$class"
