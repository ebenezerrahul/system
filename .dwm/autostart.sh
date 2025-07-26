#!/usr/bin/zsh

picom &

xrandr --output eDP-1 --right-of HDMI-1 || exit 0

udiskie &

xbindkeys &

dwmblocks &

wal -i /home/ebenezerrahul/Downloads/wallhaven-d68pdg_3840x2160.png -o /home/ebenezerrahul/.local/scripts/post_wal_script -a 50 || exit 0
