#!/bin/bash

printf "\nInstalling Phoenix...\n\n"
sleep 1

mix archive.install hex phx_new --force
sudo apt install inotify-tools -y

clear
mix phx.new --version
printf "=================="
printf "\nPhoenix installed!"
printf "\n==================\n\n"