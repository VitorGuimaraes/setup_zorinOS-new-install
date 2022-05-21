# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 100 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=100
SAVEHIST=100
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

source ~/.powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh-autosuggestions.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

echo 0 | sudo tee /sys/module/snd_hda_intel/parameters/power_save_controller
echo 0 | sudo tee /sys/module/snd_hda_intel/parameters/power_save

# Docker:
# sudo usermod -aG docker $USER
# newgrp docker
# sudo chmod 666 /var/run/docker.sock

export PATH=/bin:/usr/bin:/usr/local/bin:$HOME/.cargo/bin/:${PATH}
export EXA_COLORS="di=90;4:Dockerfile=36:*.css=36:*.jsx=36:*.c=36:*.cpp=36:*.go=36:*.py=36:*.js=34:*.exs=34:*.ex=34:*.php=34:*.html=31:*.rb=31:*.java=31:*.js=33:*.java=33:*.yml=35:*.yaml=35:*.lock=32:*.sh=32:*.zsh=32:*.bash*=32:*.zshrc=32:*.tar=32:*.gz=32:*.zip=32:*.rar=32:*.tar.gz=32:*.tar.xz=32"
alias ls="exa --icons -lh"
alias lt="exa --icons -lh --tree --level=2"
alias ll="exa --icons -lha"