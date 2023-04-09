#!/bin/bash

flatpak install flathub com.discordapp.Discord -y
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed s/.$//), 'com.discordapp.Discord.desktop']"
