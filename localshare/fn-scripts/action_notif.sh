#!/bin/sh
tip="Click to stop. Dismiss to skip wait."

if [ $# != 3 ]; then
  echo "Usage: $0 <TITLE> <MSG> <ACTION_IF_NO>"
  echo
  echo "Example: $0 'Log out' 'Logging out' 'echo logging out'"
  echo "in X seconds and '$tip'" are automatically appended to msg.
  exit 1
fi

title=$1
msg=$2
action=$3
time=10

# show notif with a sound to notify user
paplay /usr/share/sounds/freedesktop/stereo/dialog-error.oga &
result=$(notify-send -t $((time * 1000)) \
  "$title" \
  "$msg in $time seconds.\n$tip" \
  -A "default=Stop")

if [ "$result" != "default" ]; then
  $action
fi
