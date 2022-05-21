#!/bin/bash

printf "\nInstalling Elixir...\n\n"
sleep 1

wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb 
sudo dpkg -i erlang-solutions_2.0_all.deb 
sudo apt-get update 
sudo apt-get install esl-erlang elixir -y

sudo rm erlang-solutions_2.0_all.deb

clear
elixir --version
printf "================="
printf "\nElixir installed!"
printf "\n=================\n\n"