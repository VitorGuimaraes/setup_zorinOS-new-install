#!/bin/bash

printf "\nInstalling Dracula Theme...\n"

# grant that the files wasn't downloaded before
sudo rm -rf -v gtk-master
sudo rm -rf -v Dracula

wget https://github.com/dracula/gtk/archive/master.zip
unzip master.zip 
sudo rm -v master.zip 
sudo mv -v gtk-master Dracula
sudo mv -v Dracula /usr/share/themes
cp -r /usr/share/themes/Dracula $HOME/.themes/Dracula

# Apply Dracula theme to all system
gsettings set org.gnome.shell.extensions.user-theme name 'Dracula'
gsettings set org.gnome.desktop.interface gtk-theme 'Dracula'
sudo flatpak override --filesystem=$HOME/.themes

# install dconf
sudo apt-get install dconf-editor -y

# load settings
dconf load / < modern-terminal/user.conf

dracula_theme_check=$(gsettings get org.gnome.desktop.interface gtk-theme)
clear

if [[ "$dracula_theme_check" == *"Dracula"* ]]; then
    printf "Dracula Theme installed!"
else
    printf "Dracula Theme not installed!"
fi
printf "\n*******************************************************************\n"
