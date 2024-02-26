#!/bin/bash

# External monitor (Nvidia)
if [[ $(xrandr -q | grep "HDMI-1-0 connected") ]];
   then
      xrandr --output HDMI-1-0 --mode 1920x1080 --pos 0x0 --rotate normal \
             --output eDP-1 --off
fi

# Internel monitor (Nvidia)
if [[ $(xrandr -q | grep "HDMI-1-0 disconnected") ]];
   then
      xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal \
             --output HDMI-1-0 --off 
fi
