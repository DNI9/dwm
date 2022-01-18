#!/usr/bin/env bash

# Kill already running process
_ps=(picom dwmblocks keepassxc dunst polkit-gnome-au xfce4-power-manager sxhkd betterlockscreen redshift redshift-gtk)
for _prs in "${_ps[@]}"; do
	if [[ $(pidof "${_prs}") ]]; then
		killall -9 "${_prs}"
	fi
done

wmname LG3D &
#xmodmap -e "keycode 9 = Caps_Lock"; xmodmap -e "keycode 66 = Escape" &
#xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' &

hsetroot -cover "$(find ~/.dwm/wallpapers/ -type f -name '*' | shuf -n 1)"
xsetroot -cursor_name left_ptr &
nm-applet &
numlockx on &

xfce4-power-manager &

picom --experimental-backends --config ~/.dwm/picom.conf &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

exec dunst &

xset r rate 350 60 &
dwmblocks &

sxhkd -c ~/.dwm/sxhkdrc &

betterlockscreen -u "$(find ~/.dwm/wallpapers/ -type f -name '*' | shuf -n 1)" &

/usr/lib/geoclue-2.0/demos/agent &

exec redshift-gtk &
exec keepassxc &
greenclip daemon &
