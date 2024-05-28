# instructions for installing necessary programs
echo "## Installing Qtile on Manjaro Cinnamon"
echo "yay -S lxappearance rofi micro xfce4-power-manager qtile terminator syncthing-gtk quodlibet picom arandr"
cp config.py ../.config/qtile/config.py
echo "Copied over qtile config."
echo "To turn off all power options:"
echo "sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target"
