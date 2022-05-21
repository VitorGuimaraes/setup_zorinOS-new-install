#!/bin/bash

printf "\nInstalling Brightness and Temperature Control...\n\n"
sleep 1

cp -v brightness-and-temperature/brightness-decrease.sh ~/.brightness-decrease.sh
cp -v brightness-and-temperature/brightness-increase.sh ~/.brightness-increase.sh
cp -v brightness-and-temperature/color-temp-decrease.sh ~/.color-temp-decrease.sh
cp -v brightness-and-temperature/color-temp-increase.sh ~/.color-temp-increase.sh

xfconf-query --create --channel xfce4-keyboard-shortcuts --property "/commands/custom/<Alt>Left" --type string --set ~/.brightness-decrease.sh
xfconf-query --create --channel xfce4-keyboard-shortcuts --property "/commands/custom/<Alt>Right" --type string --set ~/.brightness-increase.sh
xfconf-query --create --channel xfce4-keyboard-shortcuts --property "/commands/custom/<Super><Alt>Right" --type string --set ~/.color-temp-increase.sh
xfconf-query --create --channel xfce4-keyboard-shortcuts --property "/commands/custom/<Super><Alt>Left" --type string --set ~/.color-temp-decrease.sh

clear 
printf "============================================="
printf "\nBrightness and Temperature Control installed!"
printf "\n=============================================\n"
printf "\nDecrease brightness: Alt+Left"
printf "\nIncrease brightness: Alt+Right"
printf "\nDecrease color temperature: Alt+Super+Left\n"
echo "Increase color temperature: Alt+Super+Right"