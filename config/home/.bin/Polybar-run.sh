#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# polybar top &
for i in $(polybar -m | awk -F: '{print $1}'); do MONITOR=$i polybar top & done
