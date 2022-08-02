#!/bin/bash

printf "\nInstalling Brightness and Temperature Control...\n\n"
sleep 1

mkdir -p logs 
printf "" > logs/logs_brightness_and_temperature.txt

printf "************************ $(date +"%D %T") ************************ 
→ cp -v brightness-and-temperature/brightness-decrease.sh ~/.brightness-decrease.sh 2>&1 \n%s" \
| tee -a logs/logs_brightness_and_temperature.txt
printf "$(cp -v brightness-and-temperature/brightness-decrease.sh ~/.brightness-decrease.sh 2>&1)" \
| tee -a logs/logs_brightness_and_temperature.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ cp -v brightness-and-temperature/brightness-increase.sh ~/.brightness-increase.sh 2>&1 \n%s" \
| tee -a logs/logs_brightness_and_temperature.txt
printf "$(cp -v brightness-and-temperature/brightness-increase.sh ~/.brightness-increase.sh 2>&1)" \
| tee -a logs/logs_brightness_and_temperature.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ cp -v brightness-and-temperature/color-temp-decrease.sh ~/.color-temp-decrease.sh 2>&1\n%s" \
| tee -a logs/logs_brightness_and_temperature.txt
printf "$(cp -v brightness-and-temperature/color-temp-decrease.sh ~/.color-temp-decrease.sh 2>&1)" \
| tee -a logs/logs_brightness_and_temperature.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ cp -v brightness-and-temperature/color-temp-increase.sh ~/.color-temp-increase.sh 2>&1\n%s" \
| tee -a logs/logs_brightness_and_temperature.txt
printf "$(cp -v brightness-and-temperature/color-temp-increase.sh ~/.color-temp-increase.sh 2>&1)" \
| tee -a logs/logs_brightness_and_temperature.txt

# Decrease brightness
printf "\n\n************************ $(date +"%D %T") ************************ 
→ xfconf-query --create --channel xfce4-keyboard-shortcuts --property '/commands/custom/<Alt>Left' --type string --set ~/.brightness-decrease.sh\n%s" \
| tee -a logs/logs_brightness_and_temperature.txt
printf "$(xfconf-query --create --channel xfce4-keyboard-shortcuts --property "/commands/custom/<Alt>Left" --type string --set ~/.brightness-decrease.sh)" \
| tee -a logs/logs_brightness_and_temperature.txt

# Increase brightness
printf "\n************************ $(date +"%D %T") ************************ 
→ xfconf-query --create --channel xfce4-keyboard-shortcuts --property '/commands/custom/<Alt>Right' --type string --set ~/.brightness-increase.sh\n%s" \
| tee -a logs/logs_brightness_and_temperature.txt
printf "$(xfconf-query --create --channel xfce4-keyboard-shortcuts --property "/commands/custom/<Alt>Right" --type string --set ~/.brightness-increase.sh)" \
| tee -a logs/logs_brightness_and_temperature.txt

# Decrease temperature
printf "\n************************ $(date +"%D %T") ************************ 
→ xfconf-query --create --channel xfce4-keyboard-shortcuts --property '/commands/custom/<Super><Alt>Left' --type string --set ~/.color-temp-decrease.sh\n%s" \
| tee -a logs/logs_brightness_and_temperature.txt
printf "$(xfconf-query --create --channel xfce4-keyboard-shortcuts --property "/commands/custom/<Super><Alt>Left" --type string --set ~/.color-temp-decrease.sh)" \
| tee -a logs/logs_brightness_and_temperature.txt

# Increase temperature
printf "\n************************ $(date +"%D %T") ************************ 
→ xfconf-query --create --channel xfce4-keyboard-shortcuts --property '/commands/custom/<Super><Alt>Right' --type string --set ~/.color-temp-increase.sh\n%s" \
"$(xfconf-query --create --channel xfce4-keyboard-shortcuts --property "/commands/custom/<Super><Alt>Right" --type string --set ~/.color-temp-increase.sh)" \
| tee -a logs/logs_brightness_and_temperature.txt

brightness_and_temperature_files_check=$(ls -a ~/)
brightness_and_temperature_shortcut_check=$(xfconf-query -c xfce4-keyboard-shortcuts -p /commands/custom -lv)
clear 

if [[ "$brightness_and_temperature_files_check" == *"brightness-decrease.sh"* &&
	  "$brightness_and_temperature_files_check" == *"brightness-increase.sh"* &&
	  "$brightness_and_temperature_files_check" == *"color-temp-decrease.sh"* &&
	  "$brightness_and_temperature_files_check" == *"color-temp-increase.sh"* &&
	  "$brightness_and_temperature_shortcut_check" == *"brightness-decrease.sh"* &&
	  "$brightness_and_temperature_shortcut_check" == *"brightness-increase.sh"* &&
	  "$brightness_and_temperature_shortcut_check" == *"color-temp-decrease.sh"* &&
	  "$brightness_and_temperature_shortcut_check" == *"color-temp-increase.sh"* 
	]]; then
	printf "\nBrightness and Temperature Control installed!"
    printf "\nDecrease brightness: Alt+Left"
    printf "\nIncrease brightness: Alt+Right"
    printf "\nDecrease color temperature: Alt+Super+Left"
    printf "\nIncrease color temperature: Alt+Super+Right"
else
	printf "\nBrightness and Temperature Control not installed! Check logs for errors..."
    sleep 2
fi
printf "\n*******************************************************************\n"