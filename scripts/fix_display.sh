#!/bin/sh

xrandr --newmode "1200x800"   78.00  1200 1264 1384 1568  800 803 813 831 -hsync +vsync
xrandr --addmode eDP-1 1200x800
xrandr --output eDP-1 --mode "1200x800"

