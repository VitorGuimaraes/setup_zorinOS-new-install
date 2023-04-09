#!/bin/bash

printf "\nFixing Static noise caused by Card's Power Save...\n"

printf "" > logs/logs_static_noise_power_save.txt

printf "************************ $(date +"%D %T") ************************
→ printf 'options snd_hda_intel power_save=0'
| sudo tee /etc/modprobe.d/audio_disable_powersave.conf\n\n%s" \

"$(printf 'options snd_hda_intel power_save=0' \
| sudo tee /etc/modprobe.d/audio_disable_powersave.conf)" 

static_noise_power_save_check=$(sudo cat /etc/modprobe.d/audio_disable_powersave.conf)
clear

if [[ "$static_noise_power_save_check" == *"power_save=0"* ]]; then
    printf "$(sudo cat /etc/modprobe.d/audio_disable_powersave.conf)" 
    printf "Static noise fixed!"
else
    printf "Static noise not fixed!"
fi
printf "\n*******************************************************************\n"
