#!/usr/bin/env bash

# wmname LG3D &
#change your keyboard if you need it
#setxkbmap -layout be
#swich around capslock and escape key
#xmodmap -e "keycode 9 = Caps_Lock"; xmodmap -e "keycode 66 = Escape" &
#xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' &
# killall mocicon
# mocicon &

# killall volumeicon
# volumeicon &

hsetroot -cover "$(find ~/Pictures -type f -name '*.png' | shuf -n 1)"
xsetroot -cursor_name left_ptr &
# nm-applet &
# numlockx on &
# uncomment the 3 lines below to start bluetooth on boot
#killall blueberry
#killall blueberry-tray
#blueberry-tray &
killall picom
picom --experimental-backends --config ~/.dwm/picom.conf &

killall polkit-gnome-au
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

killall dunst
exec dunst &

xset r rate 350 60 &
killall dwmblocks
dwmblocks &

killall sxhkd
sxhkd -c ~/.dwm/sxhkdrc &

# killall betterlockscreen
# betterlockscreen -u "$(cat ~/.config/nitrogen/bg-saved.cfg | grep file | sed 's/file=//g')" &
