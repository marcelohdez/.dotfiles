#!/bin/sh
echo "/run/user/$(id -u)/sway-ipc.$(id -u).$(pgrep -x sway).sock"
