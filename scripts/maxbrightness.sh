#!/bin/sh

# more intended for kernels without the right keyboard controls
echo 65535 > /sys/class/backlight/intel_backlight/brightness
