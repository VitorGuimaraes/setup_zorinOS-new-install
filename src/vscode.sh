#!/bin/bash

flatpak install flathub com.visualstudio.code -y
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed s/.$//), 'com.visualstudio.code.desktop']"

# allow dockerfile extension
flatpak override --user --filesystem=/run/docker.sock com.visualstudio.code
sed -i $'1a "docker.dockerPath": "/run/host/usr/bin/docker",' $HOME/.var/app/com.visualstudio.code/config/Code/User/settings.json
