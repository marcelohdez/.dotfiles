#!/bin/sh
TIME=10

if [ $# != 3 ]; then
  echo "Usage: $0 <TITLE> <MSG> <ACTION_IF_NO>"
  echo
  echo "Example: $0 'Log out' 'Logging out' 'echo logging out'"
  echo in "$TIME" seconds is automatically appended to msg.
  exit 1
fi

title=$1
msg=$2
action=$3

# show notif with a sound to notify user
paplay /usr/share/sounds/freedesktop/stereo/dialog-error.oga &
result=$(
  notify-send -t $((TIME * 1000)) \
    "$title" \
    "$msg in $TIME seconds.\n" \
    -A "stop=Cancel" \
    -A "continue=$title"
)

if [ "$result" = "continue" ]; then
  $action
fi
