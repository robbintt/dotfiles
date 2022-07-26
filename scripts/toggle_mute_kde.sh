#!/bin/bash

# note, can use: increase_volume, decrease_volume, mute
qdbus org.kde.kglobalaccel /component/kmix invokeShortcut "mute"
