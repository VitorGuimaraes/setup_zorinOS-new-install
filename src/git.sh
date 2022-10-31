#!/bin/bash

printf "\nInstalling Git...\n\n"
sleep 1

mkdir -p logs 
printf "" > logs/logs_git.txt

printf "************************ $(date +"%D %T") ************************ 
→ sudo add-apt-repository ppa:git-core/ppa \n\n%s" \
| tee -a logs/logs_git.txt
printf "$(sudo add-apt-repository ppa:git-core/ppa)" \
| tee -a logs/logs_git.txt

printf "************************ $(date +"%D %T") ************************ 
→ sudo apt update \n\n%s" \
| tee -a logs/logs_git.txt
printf "$(sudo apt update)" \
| tee -a logs/logs_git.txt

printf "************************ $(date +"%D %T") ************************ 
→ sudo apt install git \n\n%s" \
| tee -a logs/logs_git.txt
printf "$(sudo apt install git)" \
| tee -a logs/logs_git.txt


git_check=$(whereis git)
clear 

if [[ "$git_check" == *"/usr/bin/git"* ]]; then
    printf "\n\n************************ $(date +"%D %T") ************************" \
    | tee -a logs/logs_git.txt
    printf "\n→ git --version\n" | tee -a logs/logs_git.txt 
    printf "$(git --version) \n" | tee -a logs/logs_git.txt 
    printf "Git installed!"
else
    printf "Git not installed! Check logs for errors..."
    sleep 2
fi
printf "\n*******************************************************************\n"
