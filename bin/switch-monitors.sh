#!/bin/bash

set -e

logger -t autorandr "ACTION: $ACTION" # "change"
logger -t autorandr "SUBSYSTEM: $SUBSYSTEM" # "drm"

logger -t autorandr "Waiting for monitor configuration to change..."
#watch -g xrandr > /dev/null 2>&1

EXTERNAL_MONITOR_STATUS=$( cat /sys/class/drm/card0-HDMI-A-1/status )

logger -t autorandr "$EXTERNAL_MONITOR_STATUS"

export DISPLAY=":0"

intern="eDP1"
#extern="DP1"
extern="HDMI1"

if [ "$EXTERNAL_MONITOR_STATUS" = "connected" ]; then 
    logger -t autorandr "Ext monitor is connected"
    #sleep 2s
    xrandr --output "$intern" --off 
    xrandr --output "$extern" --auto --scale 2x2 --panning 3840x2160
    logger -t autorandr "xrandr worked"
    feh --bg-scale /home/danno131313/Pictures/Backgrounds/space.jpg
else
    xrandr --output "$extern" --off --output "$intern" --auto
fi

logger -t autorandr "Switched monitors"

exit 0
