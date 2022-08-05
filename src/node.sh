#!/bin/bash

printf "\nInstalling NodeJS...\n\n"
sleep 1

mkdir -p logs 
printf "" > logs/logs_node.txt

printf '\n\n# nvm variables' \
| tee -a ~/.zshrc
printf '\nexport NVM_DIR="$HOME/.nvm"' \
| tee -a ~/.zshrc
printf '\n[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm' \
| tee -a ~/.zshrc
printf '\n[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' \
| tee -a ~/.zshrc

git_check=$(whereis git)
if [[ "$git_check" != *"/usr/bin/git"* ]]; then
    bash src/git.sh
fi

NVM_DIR="$HOME/.nvm"
current_path=$(pwd)
git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
cd "$NVM_DIR"
git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
cd $current_path

source ~/.zshrc

nvm install node
source ~/.zshrc

node_check=$(node -v)
clear

if [[ "$node_check" == *"v"* ]]; then
    printf "\n\n************************ $(date +"%D %T") ************************" \
    | tee -a logs/logs_node.txt
    printf "\n→ node -v \n" | tee -a logs/logs_node.txt 
    printf "$(node -v) \n" | tee -a logs/logs_node.txt 
    printf "\nNode installed!"
else
    printf "\nNode not installed! Check logs for errors..."
    sleep 2
fi
printf "\n*******************************************************************\n"