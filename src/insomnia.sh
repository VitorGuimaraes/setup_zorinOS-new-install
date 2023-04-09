#!/bin/bash

flatpak install flathub rest.insomnia.Insomnia -y
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed s/.$//), 'rest.insomnia.Insomnia.desktop']"
