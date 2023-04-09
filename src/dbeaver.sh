#!/bin/bash

flatpak install flathub io.dbeaver.DBeaverCommunity -y
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed s/.$//), 'io.dbeaver.DBeaverCommunity.desktop']"
