#!/bin/sh
# Will print either 0 or 1, depending on if any input device is RUNNING
# under pipewire
INPUTS_USED=$(pactl list sources short | grep -m 1 'input.*RUNNING' -c)

# we will consider the microphone being "off" if there are 0 inputs
# being used. Both class and percent reflect this.
CLASS="off" && [[ $INPUTS_USED != "0" ]] && CLASS="on"
PERCENT=0 && [[ $CLASS == "on" ]] && PERCENT=100

printf "{\"tooltip\":\"Microphone is $CLASS.\",\"percentage\":$PERCENT,\"class\":\"$CLASS\"}\n"
