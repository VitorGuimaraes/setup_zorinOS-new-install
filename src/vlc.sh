#!/bin/bash

printf "\nInstalling VLC...\n\n"
sleep 1

mkdir -p logs 
printf "" > logs/logs_vlc.txt

printf "************************ $(date +"%D %T") ************************ 
→ sudo snap install vlc \n\n%s" \
| tee -a logs/logs_vlc.txt
printf "$(sudo snap install vlc)" \
| tee -a logs/logs_vlc.txt


vlc_check=$(whereis vlc)
clear

if [[ "$vlc_check" == *"/snap/bin/vlc"* ]]; then
    printf "************************ $(date +"%D %T") ************************" \
    | tee -a logs/logs_vlc.txt
    printf "\n→ vlc --version | grep 'VLC media'\n" | tee -a logs/logs_vlc.txt 
    printf "$(vlc --version | grep 'VLC media') \n" | tee -a logs/logs_vlc.txt 
    printf "VLC installed!"
else
    printf "VLC not installed! Check logs for errors..."
    sleep 2
fi
printf "\n*******************************************************************\n"