#!/bin/bash

flatpak install flathub md.obsidian.Obsidian -y
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed s/.$//), 'md.obsidian.Obsidian.desktop']"

git_check=$(whereis git)
if [[ "$git_check" != *"/usr/bin/git"* ]]; then
    bash src/git.sh
fi

git clone https://github.com/vitorguimaraes/ObsidianVault.git $HOME/.ObsidianVault
