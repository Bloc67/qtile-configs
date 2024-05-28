# instructions for installing necessary programs

echo "Installing Qtile on Cinnamon"
echo "---------------"
yay -S micro
echo "---------------"
echo "yay -S lxappearance rofi micro xfce4-power-manager qtile terminator syncthing-gtk quodlibet picom arandr"
echo "yay -S emby-server emby-theater qbittorrent vscodium obsidian grsync sickchill"
echo "yay mda"
echo "yay calf"
echo "yay lv2-plugins"
echo "yay dropbox"

echo "yay git ttf-roboto rofi xclip qt5-styleplugins materia-gtk-theme pnmixer network-manager-applet"
echo "wget -qO- https://git.io/papirus-icon-theme-install | sh"
cp config.py ../.config/qtile/config.py
echo "---------------"
echo "Copied over qtile config."
echo "---------------"
echo "To turn off all power options:"
echo "sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target"
echo "---------------"
echo "First install qt5-style-plugins (debian) | qt5-styleplugins (arch) and add this to the bottom of your /etc/environment

XDG_CURRENT_DESKTOP=Unity
QT_QPA_PLATFORMTHEME=gtk2

The first variable fixes most indicators (especially electron based ones!), the second tells Qt and KDE applications to use your gtk2 theme set through lxappearance."
terminator &
micro add_programs.sh
