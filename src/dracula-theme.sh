#!/bin/bash

printf "\nInstalling Dracula Theme...\n\n"
sleep 1

mkdir -p logs 
printf "" > logs/logs_dracula_theme.txt

printf "************************ $(date +"%D %T") ************************ 
→ wget -q https://github.com/dracula/gtk/archive/master.zip\n\n%s" \
| tee -a logs/logs_dracula_theme.txt
printf "$(wget -q https://github.com/dracula/gtk/archive/master.zip 2>&1)" \
| tee -a logs/logs_dracula_theme.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ unzip master.zip 2>&1 \n\n%s" \
| tee -a logs/logs_dracula_theme.txt
printf "$(unzip master.zip 2>&1 )" \
| tee -a logs/logs_dracula_theme.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo mv -v gtk-master Dracula 2>&1\n%s" \
| tee -a logs/logs_dracula_theme.txt
printf "$(sudo mv -v gtk-master Dracula 2>&1)" \
| tee -a logs/logs_dracula_theme.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo mv -v Dracula /usr/share/themes 2>&1\n%s" \
| tee -a logs/logs_dracula_theme.txt
printf "$(sudo mv -v Dracula /usr/share/themes 2>&1)" \
| tee -a logs/logs_dracula_theme.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo rm -v master.zip 2>&1\n%s" \
| tee -a logs/logs_dracula_theme.txt
printf "$(sudo rm -v master.zip 2>&1)" \
| tee -a logs/logs_dracula_theme.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo rm -rf -v gtk-master 2>&1\n%s" \
| tee -a logs/logs_dracula_theme.txt
printf "$(sudo rm -rf -v gtk-master 2>&1)" \
| tee -a logs/logs_dracula_theme.txt

printf "\n************************ $(date +"%D %T") ************************ 
→ sudo rm -rf -v Dracula\n\n%s" \
| tee -a logs/logs_dracula_theme.txt
printf "$(sudo rm -rf -v Dracula 2>&1)" \
| tee -a logs/logs_dracula_theme.txt

printf "\n\n************************ $(date +"%D %T") ************************
→ gsettings set org.gnome.shell.extensions.user-theme name 'Dracula'%s" \
| tee -a logs/logs_dracula_theme.txt
printf "$(gsettings set org.gnome.shell.extensions.user-theme name 'Dracula')" \
| tee -a logs/logs_dracula_theme.txt

printf "\n\n************************ $(date +"%D %T") ************************
→ gsettings set org.gnome.desktop.interface gtk-theme 'Dracula'%s" \
| tee -a logs/logs_dracula_theme.txt
printf "$(gsettings set org.gnome.desktop.interface gtk-theme 'Dracula')" \
| tee -a logs/logs_dracula_theme.txt

# install dconf
sudo apt-get install dconf-editor

# load settings
dconf load / < modern-terminal/user.conf

dracula_theme_check=$(gsettings get org.gnome.desktop.interface gtk-theme)
clear

if [[ "$dracula_theme_check" == *"Dracula"* ]]; then
    printf "************************ $(date +"%D %T") ************************"
    printf "\nDracula Theme installed!"
else
    printf "Dracula Theme not installed! Check logs for errors..."
    sleep 2
fi
printf "\n*******************************************************************\n"
