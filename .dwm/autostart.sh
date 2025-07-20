#!/usr/bin/zsh

picom &

xrandr --output eDP-1 --right-of HDMI-1 || exit 0

udiskie &

dwmblocks &

wal -i /home/ebenezerrahul/Downloads/wallhaven-d68pdg_3840x2160.png -a 50 || exit 0
