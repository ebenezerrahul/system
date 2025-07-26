#!/usr/bin/zsh

picom &

xrandr --output eDP-1 --right-of HDMI-1 || exit 0

xrandr --output HDMI-1 --scale 0.75x0.75 || exit 0

xrandr --output eDP-1 --scale 1x1 || exit 0

udiskie &

xbindkeys &

dwmblocks &


wal -i /home/ebenezerrahul/Downloads/wallhaven-d68pdg_3840x2160.png -o /home/ebenezerrahul/.local/scripts/post_wal_script -a 50 || exit 0
