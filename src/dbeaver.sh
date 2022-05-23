#!/bin/bash

printf "\nInstalling Dbeaver...\n\n"

mkdir -p logs 
printf "" > logs/logs_dbeaver.txt

printf "************************ $(date +"%D %T") ************************ 
→ wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb \n\n%s" \
"$(wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb 2>&1)" \
| tee -a logs/logs_dbeaver.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo dpkg -i dbeaver-ce_latest_amd64.deb \n\n%s" \
"$(sudo dpkg -i dbeaver-ce_latest_amd64.deb)" \
| tee -a logs/logs_dbeaver.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo rm -v dbeaver-ce_latest_amd64.deb \n%s" \
"$(sudo rm -v dbeaver-ce_latest_amd64.deb)" \
| tee -a logs/logs_dbeaver.txt


dbeaver_check=$(whereis dbeaver)
clear

if [[ "$dbeaver_check" == *"/usr/bin/dbeaver"* ]]; then
    printf "\n\n************************ $(date +"%D %T") ************************" \
    | tee -a logs/logs_dbeaver.txt
    printf "\n→ whereis dbeaver\n" | tee -a logs/logs_dbeaver.txt 
    printf "$(whereis dbeaver) \n" | tee -a logs/logs_dbeaver.txt 
    printf "Dbeaver installed!"
else
    printf "Dbeaver not installed! Check logs for errors..."
    sleep 2
fi
printf "\n*******************************************************************\n"