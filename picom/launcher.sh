#!/usr/bin/env bash

# Terminate any already running picom instances
killall -q picom

# Wait until the processes have been shut down
while pgrep -u $UID -x picom > /dev/null; do sleep 1; done

# Lunch new picom
picom --config ~/.config/picom/picom.conf -b
