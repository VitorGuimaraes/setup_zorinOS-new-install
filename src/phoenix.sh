#!/bin/bash

printf "\nInstalling Phoenix...\n\n"

mkdir -p logs 
printf "" > logs/logs_phoenix.txt

printf "************************ $(date +"%D %T") ************************ 
→ mix local.hex --force \n%s" \
| tee -a logs/logs_phoenix.txt
printf "$(mix local.hex --force )" \
| tee -a logs/logs_phoenix.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ mix archive.install hex phx_new --force \n\n%s" \
| tee -a logs/logs_phoenix.txt
printf "$(mix archive.install hex phx_new --force)" \
| tee -a logs/logs_phoenix.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo apt install inotify-tools -y\n\n%s" \
| tee -a logs/logs_phoenix.txt
printf "$(sudo apt install inotify-tools -y)" \
| tee -a logs/logs_phoenix.txt


phoenix_check=$(ls ~/.mix/archives | grep "phx")
clear

if [[ "$phoenix_check" == *"phx_new"* ]]; then
    printf "\n\n************************ $(date +"%D %T") ************************" \
    | tee -a logs/logs_phoenix.txt
    printf "\n→ mix phx.new --version\n" | tee -a logs/logs_phoenix.txt 
    printf "$(mix phx.new --version) \n" | tee -a logs/logs_phoenix.txt 
    printf "Phoenix installed!"
else
    printf "Phoenix not installed! Check log for errors..."
    sleep 2
fi
printf "\n*******************************************************************\n"