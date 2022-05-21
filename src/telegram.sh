#!/bin/bash

printf "\nInstalling Telegram...\n\n"
sleep 1

wget https://telegram.org/dl/desktop/linux
sudo tar -xf linux -C /opt 
sudo rm linux

clear
printf "==================="
printf "\nTelegram installed!"
printf "\n===================\n\n"
printf "\nRun: \n/opt/Telegram/./Telegram\n"
sleep 2
