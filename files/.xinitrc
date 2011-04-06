#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
userresources="$HOME/.Xresources"
if [ -f "$userresources" ];
	then xrdb -merge "$userresources";
fi

fcitx &

#use gnome theme  ;; use gtk-chtheme stead
#gnome-settings-daemon &


#auto update
update-notifier &

setxkbmap -option ctrl:nocaps       # Make Caps Lock a Control key
wine /home/liubin/.wine/drive_c/Tools/GFW/fg709x.exe &

#network manager
exec wicd-client &

exec batterymon &

#exec musca
exec awesome
# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice


