#!/bin/sh

# set touch size to be fingertip sized
# this was fixed by moving to kde plasma and then switching to synaptics and setting in kde settings
# the final step, setting the sensitivity to low non-zero fixed it, intermediate steps may or may not be required...
xinput set-prop 10 285 10 10 0
