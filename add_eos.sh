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

array=( xorg-xset xfce4-power-manager lxappearance rofi qtile terminator arandr calf mda lv2-plugins ttf-roboto xclip micro materia-gtk-theme network-manager-applet easyeffects dejavu thorium ffmpeg mpv rustdesk )
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
echo "${yel}**************************"
echo "Copy files:"
echo "--------------------------${end}"
read -p "copy over ${cyn}Qtile .config + autostart.sh ${end} (j/n)? " answer
case ${answer:0:1} in
    j|J )
        mkdir $HOME/.config/qtile
        cp autostart.sh $HOME/.config/qtile/autostart.sh
        cp config.py $HOME/.config/qtile/config.py
    ;;
    * )
        echo "${red}Skipping${end} ${cyn}Qtile files{end}"
    ;;
esac
read -p "copy over ${cyn}MPV config files ${end} (j/n)? " answer
case ${answer:0:1} in
    j|J )
        mkdir $HOME/.config/mpv
        cp -R mpv/* $HOME/.config/mpv/
    ;;
    * )
        echo "${red}Skipping${end} ${cyn}MPV files{end}"
    ;;
esac
read -p "copy over ${cyn}Easyeffects presets ${end} (j/n)? " answer
case ${answer:0:1} in
    j|J )
        cp bass.json $HOME/.config/easyeffects/output/bass.json
        cp LoudnessEqualizer.json $HOME/.config/easyeffects/output/LoudnessEqualizer.json
    ;;
    * )
        echo "${red}Skipping${end} ${cyn}easyeffects files{end}"
    ;;
esac
read -p "copy over ${cyn}Rofi ${end} (j/n)? " answer
case ${answer:0:1} in
    j|J )
        mkdir $HOME/.local/share/rofi
        cp -R rofi/* $HOME/.local/share/
        cp -R themes $HOME/.local/share/rofi/
        mkdir $HOME/.config/rofi
        cp config.rasi $HOME/.config/rofi/config.rasi
    ;;
    * )
        echo "${red}Skipping${end} ${cyn}Rofi files{end}"
    ;;
esac

cp -R config/* $HOME/.config/
lxappearance


