#!/bin/bash

sudo apt purge \
aisleriot \
'*bluez*' '*brasero*' '*brlapi*' '*brltty*' \
cheese cdrdao \
'*dvd*' \
evolution evolution-ews evolution-common '*evolution-plugin*' emacs '*evince*' \
'*firefox*' '*folks*' \
gamemode '*gnome-todo*' '*gedit*' gnome-clocks gnome-user-docs gnome-disk-utility \
gnome-online-miners gigolo '*gimp*' gnome-accessibility-themes gnome-bluetooth \
gnome-calendar gnome-contacts gnome-font-viewer gnome-maps gnome-mines gnome-photos 
gnome-power-manager gnome-screenshot gnome-software gnome-sound-recorder gnome-sudoku 
gnome-system-monitor gnome-tour gnome-weather \
info \
'*libgnome-games*' '*liblouisutdml*' '*libreoffice*' \
'*mahjongg*' '*mythes*' mousepad \
'*openoffice*' onboard \
parole pidgin pitivi ppp \
quadrapassel \
'*remmina*' '*rhythmbox*' \
'*speak*' '*speech*' sgt-puzzles \
totem totem-common totem-plugins '*transmission*' thunderbird \
xfburn \
zorin-connect zorin-gnome-tour-autostart zorin-os-tour-video

# full remove firefox apt
sudo rm -Rf $HOME/.mozilla  
sudo rm -Rf /etc/firefox
sudo rm -Rf /usr/lib/firefox
sudo rm -Rf /usr/lib/firefox-addons
sudo rm -Rf /usr/lib/mozilla

sudo apt clean 
sudo apt autoremove 
sudo apt -f install
