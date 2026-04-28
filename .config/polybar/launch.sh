#!/bin/bash
# launch.sh — Polybar launcher pour i3 | D4rkC4rl

killall -q polybar
while pgrep -u $UID -x polybar > /dev/null; do sleep 0.5; done

export MONITOR=$(xrandr --query | grep " connected" | head -1 | cut -d" " -f1)

polybar main --config="$HOME/.config/polybar/config.ini" 2>&1 | tee /tmp/polybar.log &
