#!/bin/bash

# sudo chmod +x src/*.sh
# sudo chmod +x brightness-and-temperature/*.sh

# Define enum keys
enum_keys=(
    all 
    elixir 
    phoenix 
    postgresql 
    docker 
    git
    vscode 
    dbeaver 
    modern_terminal 
    dracula_theme 
    paper_theme 
    brightness_and_temperature
    telegram 
    vlc 
    quit
)

# Declare keys associate with indexes
enum_lenght=${#enum_keys[@]}
for ((i=0; $i < $enum_lenght; i++)); do
    name=${enum_keys[$i]}
    declare ${name}=$i 
done


# Define array elements
array[all]="Install All"
function checks() {

    elixir_check=$(whereis elixir)
    phoenix_check=$(ls ~/.mix/archives | grep "phx")
    postgresql_check=$(whereis psql)
    docker_check=$(whereis docker)
    dockercompose_check=$(whereis compose)
    git_check=$(whereis git)
    vscode_check=$(whereis code)
    dbeaver_check=$(whereis dbeaver)  
    zsh_check=$(whereis zsh)
    hyper_check=$(whereis hyper)
    firacode_check=$(fc-list | grep -V "Fira Code Nerd Font")
    dracula_theme_check=$(xfconf-query -c xsettings -p /Net/ThemeName -v)
    paper_theme_check=$(sudo apt list --installed | grep "paper-icon-theme")
    telegram_check=$(ls /opt)
    vlc_check=$(whereis vlc)
    brightness_and_temperature_files_check=$(ls -a ~/)
    brightness_and_temperature_shortcut_check=$(xfconf-query -c xfce4-keyboard-shortcuts -p /commands/custom -lv)


    if [[ "$elixir_check" == *"/usr/bin/elixir"* ]]; then
        array[elixir]="* Elixir"
    else
        array[elixir]="** Elixir"
    fi

    if [[ "$phoenix_check" == *"phx_new"* ]]; then
        array[phoenix]="* Phoenix"
    else
        array[phoenix]="** Phoenix"
    fi

    if [[ "$postgresql_check" == *"/usr/bin/psql"* ]]; then
        array[postgresql]="* PostgreSQL"
    else
        array[postgresql]="** PostgreSQL"
    fi

    if [[ "$docker_check" == *"/etc/docker"* && 
        "$dockercompose_check" == *"/usr/bin/compose"* ]]; then
        array[docker]="* Docker"
    else 
        array[docker]="** Docker" 
    fi

    if [[ "$git_check" == *"/usr/bin/git"* ]]; then
        array[git]="* Git"
    else
        array[git]="** Git"
    fi

    if [[ "$vscode_check" == *"/usr/bin/code"* ]]; then
        array[vscode]="* VS Code"
    else
        array[vscode]="** VS Code"
    fi

    if [[ "$dbeaver_check" == *"/usr/bin/dbeaver"* ]]; then
        array[dbeaver]="* Dbeaver"
    else
        array[dbeaver]="** Dbeaver"
    fi

    if [[ "$zsh_check" == *"/usr/bin/zsh"* &&
        "$hyper_check" == *"/bin/hyper"* && 
        "$firacode_check" == *"by Mike Haertel"* 
        ]]; then
        array[modern_terminal]="* Modern terminal"
    else
        array[modern_terminal]="** Modern terminal "
    fi

    if [[ "$dracula_theme_check" == *"Dracula"* ]]; then
        array[dracula_theme]="* Dracula Theme"
    else
        array[dracula_theme]="** Dracula Theme"
    fi

    if [[ "$paper_theme_check" == *"paper-icon-theme"* ]]; then
        array[paper_theme]="* Paper Theme Dev Icons"
    else
        array[paper_theme]="** Paper Theme Dev Icons"
    fi

    if [[ "$brightness_and_temperature_files_check" == *"brightness-decrease.sh"* &&
        "$brightness_and_temperature_files_check" == *"brightness-increase.sh"* &&
        "$brightness_and_temperature_files_check" == *"color-temp-decrease.sh"* &&
        "$brightness_and_temperature_files_check" == *"color-temp-increase.sh"* &&
        "$brightness_and_temperature_shortcut_check" == *"brightness-decrease.sh"* &&
        "$brightness_and_temperature_shortcut_check" == *"brightness-increase.sh"* &&
        "$brightness_and_temperature_shortcut_check" == *"color-temp-decrease.sh"* &&
        "$brightness_and_temperature_shortcut_check" == *"color-temp-increase.sh"* 
        ]]; then
        array[brightness_and_temperature]="* Brightness and Temperature Control"
    else
        array[brightness_and_temperature]="** Brightness and Temperature Control"
    fi

    if [[ "$telegram_check" == *"Telegram"* ]]; then
        array[telegram]="* Telegram"
    else
        array[telegram]="** Telegram"
    fi

    if [[ "$vlc_check" == *"/snap/bin/vlc"* ]]; then
        array[vlc]="* VLC"
    else
        array[vlc]="** VLC"
    fi
}

array[quit]="Quit"

function loop() {
    checks
    printf "\nEnter the number of the option to install:\n"
    printf "(*) - installed\n"
    printf "(**) - not installed\n\n"
    
    select opt in "${array[@]}"
    do
        case $opt in

        ${array[all]})
            clear
            echo "Installing All..."
            sleep 1
            bash src/elixir.sh 
            bash src/phoenix.sh
            bash src/postgresql.sh
            bash src/docker.sh
            bash src/git.sh
            bash src/vscode.sh
            bash src/dbeaver.sh
            bash src/modern-terminal.sh
            bash src/dracula-theme.sh
            bash src/paper-theme-dev-icons.sh
            bash src/telegram.sh
            bash src/vlc.sh
            loop
            ;;

        ${array[elixir]}) 
            clear && bash src/elixir.sh
            loop
            ;;

        ${array[phoenix]}) 
            clear && bash src/phoenix.sh
            loop
            ;;

        ${array[postgresql]}) 
            clear && bash src/postgresql.sh
            loop
            ;;

        ${array[docker]}) 
            clear && bash src/docker.sh
            loop
            ;;
        
        ${array[git]}) 
            clear && bash src/git.sh
            loop
            ;;

        ${array[vscode]}) 
            clear && bash src/vscode.sh
            loop
            ;;
        
        ${array[dbeaver]}) 
            clear && bash src/dbeaver.sh
            loop
            ;;
        
        ${array[modern_terminal]}) 
            clear && bash src/modern-terminal.sh
            loop
            ;;

        ${array[dracula_theme]}) 
            clear && bash src/dracula-theme.sh
            loop
            ;;

        ${array[paper_theme]})
            clear && bash src/paper-theme-dev-icons.sh
            loop
            ;;

        ${array[brightness_and_temperature]})
            clear && bash src/brightness-and-temperature.sh
            loop
            ;;

        ${array[telegram]}) 
            clear && bash src/telegram.sh
            loop
            ;;

        ${array[vlc]}) 
            clear && bash src/vlc.sh
            loop
            ;;

        ${array[quit]})
            echo "Exiting..." && sleep 0.5
            exit
            ;;
        
        *)
            echo "Invalid option"
            ;;

        esac
    done
}

loop