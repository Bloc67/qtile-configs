# instructions for installing necessary programs
echo "## Installing Qtile on Manjaro Cinnamon"
echo "yay -S bashtop lxappearance rofi micro xfce4-power-manager"
echo "yay -S qtile terminator micro syncthing-bin syncthing-gtk quodlibet easyeffects"
cp config.py ../.config/qtile/config.py
echo "Copied over qtile config."
echo "To turn off all power options:"
echo "sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target

## to check
sudo systemctl status sleep.target suspend.target hibernate.target hybrid-sleep.target
"
