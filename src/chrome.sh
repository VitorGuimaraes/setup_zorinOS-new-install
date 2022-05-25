#!/bin/bash

printf "\nInstalling Chrome...\n\n"
sleep 1

mkdir -p logs 
printf "" > logs/logs_chrome.txt

printf "************************ $(date +"%D %T") ************************ 
→ wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb\n\n%s" \
"$(wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 2>&1)" \
| tee -a logs/logs_chrome.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo dpkg -i google-chrome-stable_current_amd64.deb\n\n%s" \
"$(sudo dpkg -i google-chrome-stable_current_amd64.deb)" \
| tee -a logs/logs_chrome.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo rm -v google-chrome-stable_current_amd64.deb \n%s" \
"$(sudo rm -v google-chrome-stable_current_amd64.deb)" \
| tee -a logs/logs_elixir.txt

chrome_check=$(whereis google-chrome) 
clear 

if [[ "$chrome_check" == *"usr/bin/google-chrome"* ]]; then
    printf "\n\n************************ $(date +"%D %T") ************************" \
    | tee -a logs/logs_chrome.txt
    printf "\n→ google-chrome --version\n" | tee -a logs/logs_chrome.txt 
    printf "$(google-chrome --version) \n" | tee -a logs/logs_chrome.txt 
    printf "Google Chrome installed!"
else
    printf "Google Chrome not installed! Check logs for errors..."
    sleep 2
fi
printf "\n*******************************************************************\n"
