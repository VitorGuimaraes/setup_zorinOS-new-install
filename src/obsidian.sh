#!/bin/bash

flatpak install flathub md.obsidian.Obsidian -y
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed s/.$//), 'md.obsidian.Obsidian.desktop']"