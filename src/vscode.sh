#!/bin/bash

flatpak install flathub com.visualstudio.code -y
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed s/.$//), 'com.visualstudio.code.desktop']"
