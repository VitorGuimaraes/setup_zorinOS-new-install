#!/bin/bash

printf "\nInstalling Insomnia...\n\n"
sleep 1

mkdir -p logs 
printf "" > logs/logs_insomnia.txt

printf "************************ $(date +"%D %T") ************************ 
→ sudo snap install insomnia \n\n%s" \
"$(sudo snap install insomnia)" \
| tee -a logs/logs_insomnia.txt


insomnia_check=$(whereis insomnia)
clear

if [[ "$insomnia_check" == *"/snap/bin/insomnia"* ]]; then
    printf "************************ $(date +"%D %T") ************************" \
    | tee -a logs/logs_insomnia.txt
    printf "\n→ whereis insomnia\n" | tee -a logs/logs_insomnia.txt 
    printf "$(whereis insomnia) \n" | tee -a logs/logs_insomnia.txt 
    printf "Insomnia installed!"
else
    printf "Insomnia not installed! Check logs for errors..."
    sleep 2
fi
printf "\n*******************************************************************\n"