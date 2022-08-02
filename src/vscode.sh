#!/bin/bash

printf "\nInstalling VS Code...\n\n"
sleep 1

mkdir -p logs 
printf "" > logs/logs_vscode.txt

printf "************************ $(date +"%D %T") ************************ 
→ sudo apt update -y \n\n%s" \
| tee -a logs/logs_vscode.txt
printf "$(sudo apt update -y)" \
| tee -a logs/logs_vscode.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo apt install software-properties-common apt-transport-https wget -y\n\n%s" \
| tee -a logs/logs_vscode.txt
printf "$(sudo apt install software-properties-common apt-transport-https wget -y)" \
| tee -a logs/logs_vscode.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add - \n\n%s" \
| tee -a logs/logs_vscode.txt
printf "$(wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add - 2>&1)" \
| tee -a logs/logs_vscode.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo add-apt-repository 'deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main' \n\n%s" \
| tee -a logs/logs_vscode.txt
printf "$(sudo add-apt-repository 'deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main' 2>&1)" \
| tee -a logs/logs_vscode.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo apt install code -y\n\n%s" \
| tee -a logs/logs_vscode.txt
printf "$(sudo apt install code -y)" \
| tee -a logs/logs_vscode.txt


vscode_check=$(whereis code)
clear

if [[ "$vscode_check" == *"/usr/bin/code"* ]]; then
    printf "\n\n************************ $(date +"%D %T") ************************" \
    | tee -a logs/logs_vscode.txt
    printf "\n→ code --version\n" | tee -a logs/logs_vscode.txt 
    printf "$(code --version) \n" | tee -a logs/logs_vscode.txt 
    printf "VS Code installed!"
else
    printf "VS Code not installed! Check logs for errors..."
    sleep 2
fi
printf "\n*******************************************************************\n"