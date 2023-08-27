#!/bin/bash

printf "\nInstalling Elixir...\n"

# Install Prerequisites
sudo apt install curl 

# Clone ASDF
git clone https://github.com/asdf-vm/asdf.git ~/.asdf

# Configure Your Shell
. $HOME/.asdf/asdf.sh

# Install Plugins
asdf plugin add erlang
asdf plugin add elixir

# Install Erlang/OTP
asdf install

asdf install erlang 26.0.2
asdf install elixir 1.15.4-otp-26

asdf global erlang 26.0.2
asdf global elixir 1.15.4-otp-26


#########################################################################
# Common installation

# printf "\nInstalling Elixir...\n"

# # Create elixir packages folder
# mkdir -p $HOME/.mix/archives
# sudo apt install make -y

# elixir_check=$(whereis elixir)
# erlang_check=$(whereis erlang)
# ubuntu_version=$(lsb_release -a)

# Option 1 to install erlang (only when esl-erlang support ssl 3)
# wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb
# sudo dpkg -i erlang-solutions_2.0_all.deb
# sudo apt update -y
# sudo apt install esl-erlang -y
# sudo rm -v erlang-solutions_2.0_all.deb

# Install libssl 1.1.1 
# if [[ "$ubuntu_version" != *"trusty"* || 
#       "$ubuntu_version" != *"saucy"* || 
#       "$ubuntu_version" != *"precise"* ]]; then
#     wget https://packages.erlang-solutions.com/erlang/debian/pool/esl-erlang_25.3-1~ubuntu~focal_amd64.deb -O esl-erlang_25.3.deb
#     sudo dpkg -i esl-erlang_25.3.deb
#     sudo apt -f install -y
#     sudo dpkg -i esl-erlang_25.3.deb
#     sudo rm -v esl-erlang_25.3.deb  

#     wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.17_amd64.deb -O libssl1.1_amd64.deb
#     sudo dpkg -i libssl1.1_amd64.deb
#     sudo rm libssl1.1_amd64.deb
# fi

# # Install Elixir
# sudo git clone -b v1.15.4 https://github.com/elixir-lang/elixir.git /opt/elixir
# sudo make clean test -C /opt/elixir
# sudo ln -sf /opt/elixir/bin/elixir /usr/bin/elixir
# sudo ln -sf /opt/elixir/bin/iex /usr/bin/iex
# sudo ln -sf /opt/elixir/bin/mix /usr/bin/mix

# clear
# if [[ "$elixir_check" == *"/opt/elixir/bin"* && "$erlang_check" == *"/erlang"*]]; then
#     elixir --version 
#     printf "Elixir installed!"
# else
#     printf "Elixir not installed!"
# fi
# printf "\n*******************************************************************\n"
