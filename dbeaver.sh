#!/bin/bash

printf "\nInstalling Dbeaver...\n"
sleep 1

wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
sudo dpkg -i dbeaver-ce_latest_amd64.deb
sudo rm dbeaver-ce_latest_amd64.deb

clear
printf "==================="
printf "\nDbeaver installed!"
printf "\n===================\n\n"