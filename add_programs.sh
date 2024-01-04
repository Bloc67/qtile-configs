# bash script for installing necessary programs, run with sudo
echo "yay -S bashtop lxappearance rofi xed micro"
echo "yay -S qtile terminator micro syncthing-bin syncthing-gtk audacious easyeffects"
echo "run them by copy and paste!"
cp config.py ../.config/qtile/config.py
echo "Copied over qtile config."
echo "Restarting.."
reboot

