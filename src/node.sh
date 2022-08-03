#!/bin/bash

printf "\nInstalling NodeJS...\n\n"
sleep 1

mkdir -p logs 
printf "" > logs/logs_node.txt

printf "************************ $(date +"%D %T") ************************ 
→ wget -q https://nodejs.org/dist/v16.16.0/node-v16.16.0-linux-x64.tar.xz\n\n%s" \
| tee -a logs/logs_node.txt
printf "$(wget -q https://nodejs.org/dist/v16.16.0/node-v16.16.0-linux-x64.tar.xz 2>&1)" \
| tee -a logs/logs_node.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo tar -xf node-v16.16.0-linux-x64.tar.xz -C /opt --transform s/node-v16.16.0-linux-x64/nodejs/ 2>&1\n\n%s" \
| tee -a logs/logs_node.txt
printf "$(sudo tar -xf node-v16.16.0-linux-x64.tar.xz -C /opt --transform s/node-v16.16.0-linux-x64/nodejs/ 2>&1 )" \
| tee -a logs/logs_node.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo rm -v node-v16.16.0-linux-x64.tar.xz 2>&1\n%s" \
| tee -a logs/logs_node.txt
printf "$(sudo rm -v node-v16.16.0-linux-x64.tar.xz 2>&1)" \
| tee -a logs/logs_node.txt

sudo chown -R $USER /opt/nodejs    

# install npm
npm i npm@7.24.2

current_path=$(sed -n "/export PATH/p" ~/.zshrc)

if [[ "$current_path" != *"nodejs"* ]]; then
    sed -i "s|export PATH=.*|$current_path:/opt/nodejs/bin/|" ~/.zshrc
    printf "\n\nNode environment variable configured!\n\n"
else
    printf "\n\nNode environment variable already configured!\n\n"
    sleep 1
fi

source ~/.zshrc

node_check=$(ls /opt)
npm_check=$(npm -v)
clear

if [[ "$node_check" == *"node"* ]]; then
    printf "\n\n************************ $(date +"%D %T") ************************" \
    | tee -a logs/logs_node.txt
    printf "\n→ node -v \n" | tee -a logs/logs_node.txt 
    printf "$(node -v) \n" | tee -a logs/logs_node.txt 
    printf "\n→ npm -v \n" | tee -a logs/logs_node.txt 
    printf "$(npm -v) \n" | tee -a logs/logs_node.txt 
    printf "\nNode installed!"
else
    printf "\nNode not installed! Check logs for errors..."
    sleep 2
fi
printf "\n*******************************************************************\n"