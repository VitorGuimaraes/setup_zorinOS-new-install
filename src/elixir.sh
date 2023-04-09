#!/bin/bash

# In case of errors, try to install manually:

# erlang-solutions: https://www.erlang-solutions.com/downloads/
# sudo apt-get install esl-erlang=1:25.0-1
# reference: 
# https://elixirforum.com/t/installing-erlang-elixir-on-ubuntu-20-04-is-failing-esl-erlang-25-0-2-1-ubuntu-focal-amd64-deb-file-has-unexpected-size/48754

# sudo apt update -y
# esl-erlang: http://binaries.erlang-solutions.com/debian/pool/
# elixir: sudo apt install elixir 

printf "\nInstalling Elixir...\n"

# Create elixir packages folder
mkdir -p $HOME/.mix/archives

wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb 
sudo dpkg -i erlang-solutions_2.0_all.deb
sudo apt update -y
sudo apt install esl-erlang -y
sudo rm -v erlang-solutions_2.0_all.deb

sudo git clone -b v1.14.4 https://github.com/elixir-lang/elixir.git /opt/elixir
sudo make clean test -C /opt/elixir

elixir_check=$(whereis elixir)
clear

if [[ "$elixir_check" == *"/opt/elixir/bin"* ]]; then
    elixir --version 
    printf "Elixir installed!"
else
    printf "Elixir not installed!"
fi
printf "\n*******************************************************************\n"