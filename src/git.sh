#!/bin/bash

printf "\nInstalling Git...\n\n"
sleep 1

sudo apt install git-all -y

clear 
git --version 
printf "=============="
printf "\nGit installed!"
printf "\n==============\n\n"