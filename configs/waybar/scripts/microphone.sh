#!/bin/sh
# these commands collect the number of input devices running under
# pipewire currently.
INPUTS_USED=$(pactl list short | grep RUNNING | grep input -c)

# we will consider the microphone being "off" if there are 0 inputs
# being used. Both class and percent reflect this.
CLASS="off" && [[ $INPUTS_USED != "0" ]] && CLASS="on"
PERCENT=0 && [[ $CLASS == "on" ]] && PERCENT=100

printf "{\"tooltip\": \"Microphone is $CLASS.\", \"percentage\": $PERCENT, \"class\": \"$CLASS\"}\n"
