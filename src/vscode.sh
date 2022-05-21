#!/bin/bash

printf "\nInstalling VS Code...\n\n"
sleep 1

sudo apt update -y
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code

clear
printf "================="
printf "\nVSCode installed!"
printf "\n=================\n\n"