# bash script for installing necessary programs, run with sudo
echo "normal programs: qtile terminator micro syncthing syncthing-gtk audacious easyeffects"
pacman -S qtile terminator micro syncthing syncthing-gtk audacious easyeffects -y

echo "extra programs: bashtop lxappearance rofi yay"
pacman -S bashtop lxappearance rofi yay -y
