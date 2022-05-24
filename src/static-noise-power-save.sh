#!/bin/bash

printf "\nFixing Static noise caused by Card's Power Save...\n\n"
sleep 1

mkdir -p logs 
printf "" > logs/logs_static_noise_power_save.txt

printf "************************ $(date +"%D %T") ************************
→ printf 'options snd_hda_intel power_save=0'
| sudo tee /etc/modprobe.d/audio_disable_powersave.conf\n\n%s" \
"$(printf 'options snd_hda_intel power_save=0' \
| sudo tee /etc/modprobe.d/audio_disable_powersave.conf)" \
| tee logs/logs_static_noise_power_save.txt

static_noise_power_save_check=$(sudo cat /etc/modprobe.d/audio_disable_powersave.conf)
clear

if [[ "$static_noise_power_save_check" == *"power_save=0"* ]]; then
    printf "************************ $(date +"%D %T") ************************\n" \
    | tee -a logs/logs_static_noise_power_save.txt
    printf "$(sudo cat /etc/modprobe.d/audio_disable_powersave.conf)" \
    | tee -a logs/logs_static_noise_power_save.txt 
    printf "\nStatic noise fixed!"
else
    printf "\nStatic noise not fixed! Check logs for errors..."
    sleep 2
fi
printf "\n*******************************************************************\n"
