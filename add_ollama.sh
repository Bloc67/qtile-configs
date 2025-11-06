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

array=( fakeroot base-devel patch nemo xed xfce4-power-manager lxappearance rofi qtile terminator arandr ttf-roboto xclip qt5-styleplugins materia-gtk-theme network-manager-applet dejavu thorium ffmpeg mpv syncthing subtitleedit ollama )
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
        mkdir $HOME/.config/qtile
        cp autostart.sh $HOME/.config/qtile/autostart.sh
        cp config-ollama.py $HOME/.config/qtile/config.py
    ;;
    * )
        echo "${red}Skipping${end} ${cyn}Qtile files{end}"
    ;;
esac
read -p "copy over ${cyn}Rofi ${end} (j/n)? " answer
case ${answer:0:1} in
    j|J )
        mkdir $HOME/.local/share/rofi
        mkdir $HOME/.local/share/rofi/themes
        cp rofi/themes/* $HOME/.local/share/rofi/themes/
        mkdir $HOME/.config/rofi
        cp config.rasi $HOME/.config/rofi/config.rasi
    ;;
    * )
        echo "${red}Skipping${end} ${cyn}Rofi files{end}"
    ;;
esac


