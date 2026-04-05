#!/bin/bash
EXTERNAL=$(xrandr | grep " connected" | grep -v eDP | awk '{print $1}' | head -1)

if [ -n "$EXTERNAL" ]; then
    xrandr --output "$EXTERNAL" --off
fi

xrandr --output eDP-1 --mode 1366x768
notify-send "Projecteur" "Écran externe désactivé"
