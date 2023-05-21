#!/bin/bash

printf "\nInstalling Dracula Theme...\n"

# grant that the files wasn't downloaded before
sudo rm -rf gtk-master
sudo rm -rf Dracula

wget https://github.com/dracula/gtk/archive/master.zip
unzip master.zip 
sudo rm master.zip 
sudo mv gtk-master Dracula
sudo mv Dracula /usr/share/themes

# Share themes with Flatpak
sudo cp -r /usr/share/themes $HOME/.local/share/themes
sudo cp -r /usr/share/icons $HOME/.local/share/icons
sudo flatpak override --filesystem=$HOME/.local/share/themes
sudo flatpak override --filesystem=$HOME/.local/share/icons

# Apply Dracula theme to all system
# gsettings set org.gnome.shell.extensions.user-theme name 'Dracula'
# gsettings set org.gnome.desktop.interface gtk-theme 'Dracula'

# install dconf
# sudo apt install dconf-editor -y

# load settings
# dconf load / < modern-terminal/user.conf

# # Apply dev-icons
# bash src/dev-icons.sh

# dracula_theme_check=$(gsettings get org.gnome.desktop.interface gtk-theme)
# clear

# if [[ "$dracula_theme_check" == *"Dracula"* ]]; then
#     printf "Dracula Theme installed!"
# else
#     printf "Dracula Theme not installed!"
# fi
# printf "\n*******************************************************************\n"
