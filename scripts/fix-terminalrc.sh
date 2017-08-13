#!/bin/bash

# This relinks my terminalrc when I change the settings for a presentation.

rm ~/.config/xfce4/terminal/terminalrc

ln -s ~/.dotfiles/terminalrc ~/.config/xfce4/terminal/terminalrc 
