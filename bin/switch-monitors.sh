#!/bin/bash

set -e

logger -t autorandr "ACTION: $ACTION" # "change"
logger -t autorandr "SUBSYSTEM: $SUBSYSTEM" # "drm"

logger -t autorandr "Waiting for monitor configuration to change..."
#watch -g xrandr > /dev/null 2>&1

extern1_status=$( cat /sys/class/drm/card0-DP-1/status )
extern2_status=$( cat /sys/class/drm/card0-HDMI-A-1/status )

logger -t autorandr "DP1: $extern1_status, HDMI1: $extern2_status"

export DISPLAY=":0"

intern="eDP1"
extern1="DP1"
extern2="HDMI1"

if [ "$extern1_status" = "connected" ]; then 
    logger -t autorandr "Ext monitor is connected"
    xrandr --output "$intern" --off 
    xrandr --output "$extern1" --auto --scale 2x2 --panning 3840x2160
    logger -t autorandr "xrandr worked"
    feh --bg-scale /home/danno131313/Pictures/Backgrounds/space.jpg
elif [ "$extern2_status" = "connected" ]; then
    logger -t autorandr "Ext monitor is connected"
    xrandr --output "$intern" --off 
    xrandr --output "$extern2" --auto --scale 2x2 --panning 3840x2160
    logger -t autorandr "xrandr worked"
    feh --bg-scale /home/danno131313/Pictures/Backgrounds/space.jpg
else
    xrandr --output "$extern1" --off --output "$extern2" --off --output "$intern" --auto
fi

logger -t autorandr "Switched monitors"

exit 0
