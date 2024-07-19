# instructions for installing necessary programs

#!/bin/bash

red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m'
blu=$'\e[1;34m'
mag=$'\e[1;35m'
cyn=$'\e[1;36m'
end=$'\e[0m'

echo "${yel}**************************"
echo "Install programs for use with Qtile:"
echo "--------------------------${end}"

array=( fakeroot base-devel patch micro xfce4-power-manager lxappearance rofi qtile terminator arandr lv2-plugins git ttf-roboto xclip qt5-styleplugins materia-gtk-theme network-manager-applet easyeffects dejavu thorium ffmpeg mpv )
for i in "${array[@]}"
    do
#        read -p "Search for ${cyn}$i${end} (j/n)? " answer
#        case ${answer:0:1} in
#            j|J )
                yay $i
                echo "${grn}***********************************${end}"
                echo "${yel}***********************************${end}"
#            ;;
#            * )
#                echo "${red}Skipping${end} ${cyn}$i${end}"
#            ;;
#        esac
done
echo "${yel}Installing Papirus icons...${end}"
wget -qO- https://git.io/papirus-icon-theme-install | sh
echo "add to /etc/environment..."
echo "XDG_CURRENT_DESKTOP=Unity" | sudo tee -a /etc/environment
echo "QT_QPA_PLATFORMTHEME=gtk2" | sudo tee -a /etc/environment
echo "${yel}Done.${end}"
echo "${grn}cat /etc/environment:${end}"
cat /etc/environment
echo "---------------------------------------------------"
echo "option allow_other only allowed if 'user_allow_other' is set in /etc/fuse.conf..opening fuse.conf:"
sudo micro /etc/fuse.conf
echo "${yel}Done.${end}"
echo "${grn}cat /etc/fuse.conf:${end}"
cat /etc/fuse.conf | grep user_allow_other

echo "${yel}**************************"
echo "Copy files:"
echo "--------------------------${end}"
read -p "copy over ${cyn}Qtile .config + autostart.sh ${end} (j/n)? " answer
case ${answer:0:1} in
    j|J )
        mkdir /home/bloc67/.config/qtile
        cp autostart.sh /home/bloc67/.config/qtile/autostart.sh
        cp config.py /home/bloc67/.config/qtile/config.py
    ;;
    * )
        echo "${red}Skipping${end} ${cyn}Qtile files{end}"
    ;;
esac
read -p "copy over ${cyn}MPV config files ${end} (j/n)? " answer
case ${answer:0:1} in
    j|J )
        cp -R mpv /home/bloc67/.config/
        cp config.py /home/bloc67/.config/qtile/config.py
    ;;
    * )
        echo "${red}Skipping${end} ${cyn}MPV files{end}"
    ;;
esac
read -p "copy over ${cyn}Easyeffects presets ${end} (j/n)? " answer
case ${answer:0:1} in
    j|J )
        cp bass.json /home/bloc67/.config/easyeffects/output/bass.json
        cp LoudnessEqualizer.json /home/bloc67/.config/easyeffects/output/LoudnessEqualizer.json
    ;;
    * )
        echo "${red}Skipping${end} ${cyn}Qtile files{end}"
    ;;
esac

echo "${yel}Adding Chaotic rep...${end}"
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'


echo "add to /etc/pacman.conf..."
echo " " | sudo tee -a /etc/pacman.conf
echo "[chaotic-aur]" | sudo tee -a /etc/pacman.conf
echo "Include = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
echo "${yel}Done.${end}"
echo "${grn}cat /etc/pacman.conf:${end}"
cat /etc/pacman.conf


