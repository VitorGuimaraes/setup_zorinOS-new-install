#!/bin/bash

printf "\nInstalling Modern Terminal...\n\n"
sleep 1

# Install and set zsh terminal:
sudo apt install zsh cargo -y && cargo install exa 
printf "\n===================================================="
printf "\nChanging shell to zsh. Please, insert your password:"
printf "\n====================================================\n"
sudo chsh -s /usr/bin/zsh 
sleep 1

# Copy zsh and hyper js files
printf "\n===================="
printf "\nCoping config files\n"
cp -v modern-terminal/.p10k.zsh \
      modern-terminal/.hyper.js \
      modern-terminal/.zshrc \
      modern-terminal/.zsh-autosuggestions.zsh ~/ 
sleep 1

# Install hyper
printf "\n=================="
printf "\nInstalling Hyper"
printf "\n==================\n"
wget https://releases.hyper.is/download/deb
sudo dpkg -i deb 
sudo rm deb 
sleep 1

# Set hyper as default shell
printf "\n==============================="
printf "\nSetting Hyper as default shell"
printf "\n===============================\n"
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/hyper 50
sed -i '/TerminalEmulator/d' ~/.config/xfce4/helpers.rc
echo "TerminalEmulator=debian-x-terminal-emulator" >> ~/.config/xfce4/helpers.rc
sleep 1

# Install Fira Code nerd font
printf "\n===================="
printf "\nInstalling Fira Code"
printf "\n====================\n"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip -o FiraCode.zip -d $HOME/.local/share/fonts/
sudo rm FiraCode.zip
sleep 1

clear
printf "============================"
printf "\nModern Terminal installed!!!"
printf "\n============================\n\n"