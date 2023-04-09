#!/bin/bash

printf "\nInstalling Modern Terminal...\n"

sudo apt install zsh build-essential -y 
curl https://sh.rustup.rs -sSf | sh -s -- -y
cargo install exa
chsh -s $(which zsh)

cp -v modern-terminal/.p10k.zsh $HOME
cp -v modern-terminal/.hyper.js $HOME 
cp -v modern-terminal/.zshrc $HOME
cp -v modern-terminal/.bash_aliases $HOME
cp -v modern-terminal/.zsh-autosuggestions.zsh $HOME
cp -v modern-terminal/.zsh-syntax-highlighting $HOME

wget https://releases.hyper.is/download/deb -O hyperjs.deb
sudo dpkg -i hyperjs.deb 
rm -v hyperjs.deb 
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed s/.$//), 'hyper.desktop']"

sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/hyper 50
sed -i '/TerminalEmulator/d' $HOME/.config/xfce4/helpers.rc
echo "TerminalEmulator=debian-x-terminal-emulator" >> $HOME/.config/xfce4/helpers.rc

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip -O test.zip
unzip -o FiraCode.zip -d $HOME/.local/share/fonts/
rm -v FiraCode.zip

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.powerlevel10k
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
echo 'y' | $HOME/.fzf/install

zsh_check=$(whereis zsh)
hyper_check=$(whereis hyper)
firacode_check=$(fc-list | grep "Fira Code Regular Nerd Font Complete.ttf")
exa_check=$(whereis exa)
power_level10k_check=$(ls -a $HOME)
fzf_check=$(ls -a $HOME)
clear 

if [[ "$zsh_check" == *"/usr/bin/zsh"* ]]; then
    printf "Shell ZSH installed!"
else 
	"Shell ZSH not installed!"
fi

if [[ "$hyper_check" == *"/bin/hyper"* ]]; then
    printf "Hyper JS installed!" 
else 
	"Hyper JS not installed!" 
fi
    
if [[ "$firacode_check" == *"Fira Code Regular Nerd Font"* ]]; then 
    printf "Fira Code installed!" 
else 
	"Fira Code not installed!" 
fi

if [[ "$exa_check" == *".cargo/bin/exa"* ]]; then 
    printf "Exa installed!" 
else 
	printf "Exa not installed!" 
fi

if [[ "$power_level10k_check" == *".powerlevel10k"* ]]; then 
    printf "Powerlevel10k installed!" 
else 
	printf "Powerlevel10k not installed!" 
fi

if [[ "$fzf_check" == *".fzf"* ]]; then 
    printf "fzf installed!" 
else 
	printf "fzf not installed!" 
fi

if [[ "$zsh_check" == *"/usr/bin/zsh"* &&
	  "$hyper_check" == *"/bin/hyper"* && 
	  "$firacode_check" == *"Fira Code Regular Nerd Font"* &&
	  "$exa_check" == *".cargo/bin/exa"* &&
	  "$power_level10k_check" == *".powerlevel10k"* &&
	  "$fzf_check" == *".fzf"* 
	]]; then 
	printf "Modern Terminal installed!"
else
	printf "Modern Terminal not installed yet!" 
	printf "Logoff and login to apply changes or check logs for errors"
fi
printf "\n******************************************************************\n"
