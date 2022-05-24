#!/bin/bash

sudo apt purge 'libreoffice*' emacs mousepad onboard info xfburn gnome-mines sgt-puzzles gnome-sudoku gimp pidgin thunderbird transmission-gtk parole gigolo
sudo apt clean 
sudo apt autoremove 
sudo apt -f install