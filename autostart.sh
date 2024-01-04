#!/bin/bash
#

#/home/bloc67/.config/qtile/do_stereo.sh
picom &
#nohup qbittorrent-nox &
nm-applet --indicator &
#syncthing-gtk &
numlockx on &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)
xfce4-power-manager &
#dropbox &


