#!/bin/bash

wget https://github.com/dracula/gtk/archive/master.zip 
unzip master.zip 
sudo mv gtk-master Dracula
sudo mv -v Dracula /usr/share/themes
sudo rm master.zip

xfconf-query -c xsettings -p /Net/ThemeName -s "Dracula"

printf "\n\n========================"
printf "\nDracula theme installed!\n"
echo "========================"