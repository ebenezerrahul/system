#!/usr/bin/zsh

picom &

xrandr --output eDP-1 --right-of HDMI-1 || exit 0

feh --bg-fill ~/Downloads/wallhaven-x11oyz_1920x1080.png || exit 0

