#!/bin/bash

printf "\nInstalling Phoenix...\n"

mix local.hex --force 
mix archive.install hex phx_new --force
sudo apt install inotify-tools -y

phoenix_check=$(ls $HOME/.mix/archives | grep "phx")
clear

if [[ "$phoenix_check" == *"phx_new"* ]]; then
    mix phx.new --version
    printf "Phoenix installed!"
else
    printf "Phoenix not installed!"
fi
printf "\n*******************************************************************\n"