#!/bin/bash

printf "\nInstalling Telegram...\n\n"
sleep 1

mkdir -p logs 
printf "" > logs/logs_telegram.txt

printf "************************ $(date +"%D %T") ************************ 
→ sudo snap install telegram-desktop\n%s" \
| tee -a logs/logs_telegram.txt
printf "$(sudo snap install telegram-desktop)" \
| tee -a logs/logs_telegram.txt


telegram_check=$(whereis telegram-desktop)
clear

if [[ "$telegram_check" == *"/snap/bin/telegram-desktop"* ]]; then
    printf "\n************************ $(date +"%D %T") ************************" \
    | tee -a logs/logs_telegram.txt
    printf "\n→ snap info telegram-desktop | grep 'name\|installed\n" | tee -a logs/logs_telegram.txt 
    printf "$(snap info telegram-desktop | grep 'name\|installed') \n" | tee -a logs/logs_telegram.txt 
    printf "Telegram installed!"
else
    printf "Telegram not installed! Check logs for errors..."
    sleep 2
fi
printf "\n*******************************************************************\n"
