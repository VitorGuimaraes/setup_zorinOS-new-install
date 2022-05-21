#!/bin/bash

printf "\nInstalling Dracula Theme...\n\n"
sleep 1

wget https://github.com/dracula/gtk/archive/master.zip 
unzip master.zip 
sudo mv gtk-master Dracula
sudo mv -v Dracula /usr/share/themes
sudo rm master.zip

sudo rm -Rf gtk-master
sudo rm -Rf Dracula

xfconf-query -c xsettings -p /Net/ThemeName -s "Dracula"

clear
printf "========================"
printf "\nDracula theme installed!"
printf "\n========================\n\n"