#!/bin/bash

sudo apt purge 'libreoffice*' 'emacs*' 'redshift*' 'remmina*' '*cheese*' '*mahjongg*' aisleriot quadrapassel gnome-sound-recorder pitivi mousepad onboard info xfburn gnome-mines sgt-puzzles gnome-sudoku gimp pidgin thunderbird transmission-gtk parole gigolo
sudo apt clean 
sudo apt autoremove 
sudo apt -f install