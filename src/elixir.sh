#!/bin/bash

printf "\nInstalling Elixir...\n\n"
sleep 1

wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb 
sudo dpkg -i erlang-solutions_2.0_all.deb 
sudo apt update 
sudo apt install esl-erlang elixir -y

sudo rm erlang-solutions_2.0_all.deb

clear
elixir_check=$(whereis elixir)

printf "================="
if [[ "$elixir_check" == *"/usr/bin/elixir"* ]]; then
    elixir --version
    printf "\nElixir installed!"
else
    printf "\nElixir not installed! Check for errors..."
    sleep 2
fi
printf "\n=================\n\n"