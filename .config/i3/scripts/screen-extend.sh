#!/bin/bash
EXTERNAL=$(xrandr | grep " connected" | grep -v eDP | awk '{print $1}' | head -1)

if [ -z "$EXTERNAL" ]; then
    notify-send -u critical "Projecteur" "Aucun écran externe détecté"
    exit 1
fi

xrandr --output eDP-1 --mode 1366x768 --output "$EXTERNAL" --right-of eDP-1 --auto
notify-send "Projecteur" "Extension activée sur $EXTERNAL"
