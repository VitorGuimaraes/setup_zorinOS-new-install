#!/bin/bash

# Define enum keys
enum_keys=(
    all 
    elixir 
    phoenix 
    postgresql 
    docker 
    git
    vscode 
    insomnia
    dbeaver 
    modern_terminal 
    dracula_theme 
    paper_theme 
    brightness_and_temperature
    telegram 
    vlc 
    chrome
    system_program_problem_detected
    static_noise_power_save
    uninstaller
    quit
)

# Declare keys associate with indexes
enum_lenght=${#enum_keys[@]}
for ((i=0; $i < $enum_lenght; i++)); do
    name=${enum_keys[$i]}
    declare ${name}=$i 
done

# Create elixir packages folder
mkdir -p ~/.mix/archives

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
    insomnia_check=$(whereis insomnia)
    dbeaver_check=$(whereis dbeaver)  
    zsh_check=$(whereis zsh)
    hyper_check=$(whereis hyper)
    firacode_check=$(fc-list | grep "Fira Code Regular Nerd Font Complete.ttf")
    exa_check=$(whereis exa)
    power_level10k_check=$(ls -a ~/)
    dracula_theme_check=$(xfconf-query -c xsettings -p /Net/ThemeName -v)
    paper_theme_check=$(ls /usr/share/icons | grep Paper)
    telegram_check=$(whereis telegram-desktop)
    vlc_check=$(whereis vlc)
    chrome_check=$(whereis google-chrome) 
    brightness_and_temperature_files_check=$(ls -a ~/)
    brightness_and_temperature_shortcut_check=$(xfconf-query -c xfce4-keyboard-shortcuts -p /commands/custom -lv)
    system_program_problem_detected_check=$(cat /etc/default/apport | grep "enabled")  
    static_noise_power_save_check=$(sudo cat /etc/modprobe.d/audio_disable_powersave.conf)

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

    if [[ "$insomnia_check" == *"/snap/bin/insomnia"* ]]; then
        array[insomnia]="* Insomnia"
    else
        array[insomnia]="** Insomnia"
    fi
    

    if [[ "$dbeaver_check" == *"/usr/bin/dbeaver"* ]]; then
        array[dbeaver]="* Dbeaver"
    else
        array[dbeaver]="** Dbeaver"
    fi

    if [[ "$zsh_check" == *"/usr/bin/zsh"* &&
          "$hyper_check" == *"/bin/hyper"* && 
          "$firacode_check" == *"Fira Code Regular Nerd Font"*  &&
          "$exa_check" == *".cargo/bin/exa"* && 
          "$power_level10k_check" == *".powerlevel10k"*
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

    if [[ "$paper_theme_check" == *"Paper"* ]]; then
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

    if [[ "$telegram_check" == *"/snap/bin/telegram-desktop"* ]]; then
        array[telegram]="* Telegram"
    else
        array[telegram]="** Telegram"
    fi

    if [[ "$vlc_check" == *"/snap/bin/vlc"* ]]; then
        array[vlc]="* VLC"
    else
        array[vlc]="** VLC"
    fi

    if [[ "$chrome_check" == *"usr/bin/google-chrome"* ]]; then
        array[chrome]="* Google Chrome"
    else
        array[chrome]="** Google Chrome"
    fi

    if [[ "$system_program_problem_detected_check" == *"enabled=0"* ]]; then
        array[system_program_problem_detected]="* Fix for 'System Program Problem Detected'"
    else
        array[system_program_problem_detected]="** Fix for 'System Program Problem Detected'"
    fi

    if [[ "$static_noise_power_save_check" == *"power_save=0"* ]]; then
    array[static_noise_power_save]="* Fix for Static noise caused by Card's Power Save"
    else
        array[static_noise_power_save]="** Fix for Static noise caused by Card's Power Save"
    fi
}
array[uninstaller]="Remove trash packages"
array[quit]="Quit"

favorites="favorites=exo-web-browser.desktop,exo-file-manager.desktop"
current_favorites=$(cat ~/.config/xfce4/panel/whiskermenu-1.rc | grep 'favorites=')
function add_favorites() {
    if [[ $vscode_check == *"/usr/bin/code"* &&
          $current_favorites != "code.desktop" ]]; then 
        favorites="${favorites},code.desktop"
    fi 

    if [[ $insomnia_check == *"/snap/bin/insomnia"* &&
          $current_favorites != "insomnia_insomnia.desktop" ]]; then 
        favorites="${favorites},insomnia_insomnia.desktop"
    fi 

    if [[ $dbeaver_check == *"/usr/bin/dbeaver"* &&
          $current_favorites != "dbeaver-ce.desktop" ]]; then 
        favorites="${favorites},dbeaver-ce.desktop" 
    fi 

    if [[ $chrome_check == *"usr/bin/google-chrome"* &&
          $current_favorites != "google-chrome.desktop" ]]; then 
        favorites="${favorites},google-chrome.desktop"
    fi 

    if [[ $telegram_check == *"/snap/bin/telegram-desktop"* &&
          $current_favorites != "telegram-desktop.desktop" ]]; then 
        favorites="${favorites},telegram-desktop_telegram-desktop.desktop"
    fi 

    sed -i "s/favorites=.*/${favorites}/" ~/.config/xfce4/panel/whiskermenu-1.rc
}


function loop() {
    checks
    add_favorites
    printf "\nEnter the number of the option to install:\n"
    printf "(*) - installed\n"
    printf "(**) - not installed\n\n"
    printf "After install, restart to apply all changes\n"
    
    select opt in "${array[@]}"
    do
        case $opt in

        ${array[all]})
            clear
            echo "Installing All..."
            bash src/elixir.sh 
            bash src/phoenix.sh
            bash src/postgresql.sh
            bash src/docker.sh
            bash src/git.sh
            bash src/vscode.sh
            bash src/insomnia.sh
            bash src/dbeaver.sh
            bash src/modern-terminal.sh
            bash src/dracula-theme.sh
            bash src/paper-theme-dev-icons.sh
            bash src/brightness-and-temperature.sh
            bash src/telegram.sh
            bash src/vlc.sh
            bash src/chrome.sh
            bash src/system-program-problem.sh 
            bash src/static-noise-power-save.sh 
            bash src/uninstaller.sh
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

        ${array[insomnia]}) 
            clear && bash src/insomnia.sh
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

        ${array[chrome]}) 
            clear && bash src/chrome.sh
            loop
            ;;
        
        ${array[system_program_problem_detected]}) 
            clear && bash src/system-program-problem.sh
            loop
            ;;

        ${array[static_noise_power_save]}) 
            clear && bash src/static-noise-power-save.sh 
            loop
            ;; 

        ${array[uninstaller]}) 
            clear && bash src/uninstaller.sh 
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