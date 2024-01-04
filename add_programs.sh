# bash script for installing necessary programs, run with sudo
echo "yay -S bashtop lxappearance rofi xed micro"
echo "yay -S qtile terminator micro syncthing-bin syncthing-gtk audacious easyeffects"
echo "run them by copy and paste!"
cp config.py ../.config/qtile/config.py
echo "Copied over qtile config."
echo "Restarting.."
echo "Press any key to reboot"

# Loop until a key is pressed
while true; do
read -rsn1 key # Read a single character silently
if [[ -n "$key" ]]; then
  break # Exit the loop if a key is pressed
fi
done
reboot

