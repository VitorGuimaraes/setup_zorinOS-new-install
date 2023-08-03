#!/bin/bash

sudo apt purge aisleriot '*bluez*' '*brasero*' '*brlapi*' '*brltty*' -y
sudo apt purge cheese cdrdao '*dvd*' evolution evolution-ews evolution-common '*evolution-plugin*' emacs '*evince*' '*firefox*' '*folks*' -y 
sudo apt purge gigolo '*gimp*' gamemode '*gnome-todo*' '*gedit*' gnome-clocks gnome-user-docs gnome-disk-utility gnome-online-miners -y
sudo apt purge gnome-accessibility-themes gnome-bluetooth gnome-calendar gnome-contacts gnome-font-viewer gnome-maps gnome-mines gnome-photos -y 
sudo apt purge gnome-power-manager gnome-screenshot gnome-sound-recorder gnome-sudoku -y
sudo apt purge gnome-system-monitor gnome-tour gnome-weather info -y
sudo apt purge '*libgnome-games*' '*liblouisutdml*' '*libreoffice*' '*mahjongg*' '*mythes*' mousepad -y
sudo apt purge '*openoffice*' onboard parole pidgin pitivi ppp -y
sudo apt purge quadrapassel '*remmina*' '*rhythmbox*' shotwell '*speak*' '*speech*' sgt-puzzles -y 
sudo apt purge totem totem-common totem-plugins '*transmission*' '*thunderbird*' xfburn xorg-docs-core -y
sudo apt purge zorin-connect zorin-gnome-tour-autostart zorin-os-tour-video -y
sudo apt install gnome-control-center
# full remove firefox apt
sudo snap remove --purge firefox
sudo rm -rf $HOME/.mozilla  
sudo rm -rf /etc/firefox
sudo rm -rf /usr/lib/firefox
sudo rm -rf /usr/lib/firefox-addons
sudo rm -rf /usr/lib/mozilla
sudo rm -rf $HOME/snap

# remove snap store
sudo snap remove --purge snap-store

sudo apt clean -y
sudo apt autoremove -y 
sudo apt -f install -y
sudo apt autoremove -y
