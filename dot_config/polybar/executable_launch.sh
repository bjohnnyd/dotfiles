#!/bin/bash

# Terminate already running bar instances
killall -q polybar

. ~/.zshrc
echo $PATH > ~/Downloads/test.polybar.log
# Wait till all shutdown
while pgrep -u $UID -x polybar > /dev/null; do sleep 1;done

# Only example bar for now
## -r restarts on changes
polybar example -r &
