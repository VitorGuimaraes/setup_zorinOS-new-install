#!/bin/bash

printf "\nInstalling VS Code...\n\n"
sleep 1

sudo apt-get update -y
sudo apt-get install code -y

clear
printf "================="
printf "\nVSCode installed!"
printf "\n=================\n\n"