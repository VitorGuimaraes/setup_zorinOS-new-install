#!/bin/bash

printf "\nInstalling Phoenix...\n"

mix local.hex --force 
mix archive.install hex phx_new --force
sudo apt install inotify-tools -y

phoenix_check=$(mix phx.new --version)
clear

if [[ "$phoenix_check" == *"Phoenix installer v"* ]]; then
    mix phx.new --version
    printf "Phoenix installed!"
else
    printf "Phoenix not installed!"
fi
printf "\n*******************************************************************\n"