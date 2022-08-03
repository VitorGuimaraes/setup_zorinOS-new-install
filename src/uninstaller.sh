#!/bin/bash

sudo apt purge \
aisleriot \
'*bluez*' '*brasero*' '*brlapi*' '*brltty*' \
cheese cdrdao \
'*dvd*' \
evolution evolution-ews evolution-common '*evolution-plugin*' emacs '*evince*' \
'*folks*' \
'*gnome-todo*' '*gedit*' gnome-clocks gnome-user-docs gamemode gnome-online-accounts \
gnome-online-miners gigolo '*gimp*' gnome-accessibility-themes gnome-bluetooth \
gnome-calendar gnome-contacts gnome-maps gnome-mines gnome-photos \
gnome-sound-recorder gnome-sudoku gnome-tour gnome-weather \
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

sudo apt clean 
sudo apt autoremove 
sudo apt -f install