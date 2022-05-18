#!/bin/bash

# Install and set zsh terminal:
sudo apt install zsh cargo -y && cargo install exa 
printf "\n===================================================="
printf "\nChanging shell to zsh. Please, insert your password:\n"
chsh -s /usr/bin/zsh 

# Copy zsh and hyper js files
printf "\n===================="
printf "\nCoping config files\n"
cp -v modern-terminal/.p10k.zsh \
      modern-terminal/.hyper.js \
      modern-terminal/.zshrc \
      modern-terminal/.zsh-autosuggestions.zsh ~/ 

# Install hyper
printf "\n=================="
printf "\nInstalling Hyper\n"
wget https://releases.hyper.is/download/deb
sudo dpkg -i deb 
sudo rm deb 

# Set hyper as default shell
printf "\n=================="
printf "\nSetting Hyper as default shell\n"
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/hyper 50
sed -i '/TerminalEmulator/d' ~/.config/xfce4/helpers.rc
echo "TerminalEmulator=debian-x-terminal-emulator" >> ~/.config/xfce4/helpers.rc

# Install Fira Code nerd font
printf "\n===================="
printf "\nInstalling Fira Code\n"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip -o FiraCode.zip -d $HOME/.local/share/fonts/
sudo rm FiraCode.zip

printf "\n=================="
printf "\nModern Terminal installed!!!\n"