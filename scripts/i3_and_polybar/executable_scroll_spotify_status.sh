#!/bin/bash

STATUS="$HOME/dotfiles/scripts/get_spotify_status.sh"
# see man zscroll for documentation of the following parameters
zscroll -l 30 \
        --delay 0.1 \
        --scroll-padding "  " \
        --match-command "${STATUS} --status" \
        --match-text "Playing" "--scroll 1" \
        --match-text "Paused" "--scroll 0" \
        --update-check true "${STATUS}" &

wait
