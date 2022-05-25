#!/bin/bash

printf "\nInstalling Modern Terminal...\n\n"
sleep 1

mkdir -p logs 
printf "" > logs/logs_modern_terminal.txt

printf "************************ $(date +"%D %T") ************************ 
→ sudo apt install zsh cargo -y\n%s" \
"$(sudo apt install zsh cargo -y 2>&1)" \
| tee -a logs/logs_modern_terminal.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ cargo install exa \n\n%s" \
"$(cargo install exa 2>&1)" \
| tee -a logs/logs_modern_terminal.txt

printf "\n\n************************ $(date +"%D %T") ************************" \
| tee -a logs/logs_modern_terminal.txt
printf "\n→ chsh -s /usr/bin/zsh" | tee -a logs/logs_modern_terminal.txt
printf "\n====================================================" | tee -a logs/logs_modern_terminal.txt
printf "\nChanging shell to zsh. Please, insert your password:" | tee -a logs/logs_modern_terminal.txt
printf "\n====================================================\n" | tee -a logs/logs_modern_terminal.txt
printf "\n%s" "$(chsh -s /usr/bin/zsh)" | tee -a logs/logs_modern_terminal.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ cp -v modern-terminal/.p10k.zsh ~/ 2>&1\n%s" \
"$(cp -v modern-terminal/.p10k.zsh ~/ 2>&1)" \
| tee -a logs/logs_modern_terminal.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ cp -v modern-terminal/.hyper.js ~/ 2>&1\n%s" \
"$(cp -v modern-terminal/.hyper.js ~/ 2>&1)" \
| tee -a logs/logs_modern_terminal.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ cp -v modern-terminal/.zshrc ~/ 2>&1\n%s" \
"$(cp -v modern-terminal/.zshrc ~/ 2>&1)" \
| tee -a logs/logs_modern_terminal.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ cp -v modern-terminal/.zsh-autosuggestions.zsh ~/ 2>&1\n%s" \
"$(cp -v modern-terminal/.zsh-autosuggestions.zsh ~/ 2>&1)" \
| tee -a logs/logs_modern_terminal.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ wget -q https://releases.hyper.is/download/deb\n\n %s" \
"$(wget -q https://releases.hyper.is/download/deb 2>&1)" \
| tee -a logs/logs_modern_terminal.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo dpkg -i deb \n\n%s" \
"$(sudo dpkg -i deb )" \
| tee -a logs/logs_modern_terminal.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo rm -v deb 2>&1 \n%s" \
"$(sudo rm -v deb 2>&1)" \
| tee -a logs/logs_modern_terminal.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo update-alternatives --install /usr/bin/x-terminal-emulator \
x-terminal-emulator /usr/local/bin/hyper 50 %s" \
"$(sudo update-alternatives --install /usr/bin/x-terminal-emulator \
x-terminal-emulator /usr/local/bin/hyper 50)" \
| tee -a logs/logs_modern_terminal.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sed -i '/TerminalEmulator/d' ~/.config/xfce4/helpers.rc %s" \
"$(sed -i '/TerminalEmulator/d' ~/.config/xfce4/helpers.rc)" \
| tee -a logs/logs_modern_terminal.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ echo "TerminalEmulator=debian-x-terminal-emulator" >> ~/.config/xfce4/helpers.rc \n\n%s" \
"$(echo "TerminalEmulator=debian-x-terminal-emulator" >> ~/.config/xfce4/helpers.rc)" \
| tee -a logs/logs_modern_terminal.txt

printf "************************ $(date +"%D %T") ************************ 
→ wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip\n\n %s" \
"$(wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip 2>&1)" \
| tee -a logs/logs_modern_terminal.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ unzip -o FiraCode.zip -d $HOME/.local/share/fonts/ 2>&1\n\n%s" \
"$(unzip -o FiraCode.zip -d $HOME/.local/share/fonts/ 2>&1)" \
| tee -a logs/logs_modern_terminal.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo rm -v FiraCode.zip 2>&1 \n%s" \
"$(sudo rm -v FiraCode.zip 2>&1)" \
| tee -a logs/logs_modern_terminal.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k\n\n%s" \
"$(git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k)" \
| tee -a logs/logs_modern_terminal.txt

zsh_check=$(whereis zsh)
hyper_check=$(whereis hyper)
firacode_check=$(fc-list | grep "Fira Code Regular Nerd Font Complete.ttf")
exa_check=$(whereis exa)
power_level10k_check=$(ls -a ~/)
clear 

printf "\n\n************************ $(date +"%D %T") ************************" \
    | tee -a logs/logs_modern_terminal.txt
if [[ "$zsh_check" == *"/usr/bin/zsh"* ]]; then
    printf "\nShell ZSH installed!" | tee -a logs/logs_modern_terminal.txt
else 
	"\nShell ZSH not installed! Check logs for errors..."
fi

printf "\n************************ $(date +"%D %T") ************************" \
    | tee -a logs/logs_modern_terminal.txt
if [[ "$hyper_check" == *"/bin/hyper"* ]]; then
    printf "\nHyper JS installed!" | tee -a logs/logs_modern_terminal.txt
else 
	"\nHyper JS not installed! Check logs for errors..." | tee -a logs/logs_modern_terminal.txt
fi

printf "\n************************ $(date +"%D %T") ************************" \
    | tee -a logs/logs_modern_terminal.txt
if [[ "$firacode_check" == *"Fira Code Regular Nerd Font"* ]]; then 
    printf "\nFira Code installed!" | tee -a logs/logs_modern_terminal.txt
else 
	"\nFira Code not installed! Check logs for errors..." | tee -a logs/logs_modern_terminal.txt
fi

printf "\n************************ $(date +"%D %T") ************************" \
    | tee -a logs/logs_modern_terminal.txt
if [[ "$exa_check" == *".cargo/bin/exa"* ]]; then 
    printf "\nExa installed!" | tee -a logs/logs_modern_terminal.txt
else 
	printf "\nExa not installed! Check logs for errors..." | tee -a logs/logs_modern_terminal.txt
fi

printf "\n************************ $(date +"%D %T") ************************" \
    | tee -a logs/logs_modern_terminal.txt
if [[ "$power_level10k_check" == *".powerlevel10k"* ]]; then 
    printf "\nPowerlevel10k installed!" | tee -a logs/logs_modern_terminal.txt
else 
	printf "\nPowerlevel10k not installed! Check logs for errors..." | tee -a logs/logs_modern_terminal.txt
fi


if [[ "$zsh_check" == *"/usr/bin/zsh"* &&
	  "$hyper_check" == *"/bin/hyper"* && 
	  "$firacode_check" == *"Fira Code Regular Nerd Font"* &&
	  "$exa_check" == *".cargo/bin/exa"* &&
	  "$power_level10k_check" == *".powerlevel10k"* 
	]]; then
	printf "\n************************ $(date +"%D %T") ************************" 
	printf "\nModern Terminal installed!"
else
	printf "\nModern Terminal not installed yet!" 
	printf "\nLogoff and login to apply changes or check logs for errors"
	sleep 2
fi
printf "\n*******************************************************************\n"