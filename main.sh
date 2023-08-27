#!/bin/bash

printf "Please insert your root password: "
read password

# Define enum keys
enum_keys=(
    all 
    elixir 
    phoenix 
    postgresql 
    docker 
    git
    node
    modern_terminal 
    dracula_theme 
    vscode 
    insomnia
    dbeaver 
    obsidian
    discord
    telegram 
    static_noise_power_save
)

# Declare keys associate with indexes
enum_lenght=${#enum_keys[@]}
for ((i=0; $i < $enum_lenght; i++)); do
    name=${enum_keys[$i]}
    declare ${name}=$i 
done

# Install Flatpak if not installed
flatpak_check=$(flatpak --version)
if [[ "$flatpak_check" != *"Flatpak"* ]]; then
    printf "\nInstalling Flatpak...\n\n"
    echo $password | sudo -S apt install flatpak -y
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

installed="Already installed"
not_installed="Not installed"

# Define array elements
function checks() {

    elixir_check=$(whereis elixir)
    phoenix_check=$(ls $HOME/.mix/archives | grep "phx")
    postgresql_check=$(whereis psql)
    docker_check=$(whereis docker)
    dockercompose_check=$(whereis compose)
    git_check=$(whereis git)
    node_check=$(whereis node)
    zsh_check=$(whereis zsh)
    hyper_check=$(whereis hyper)
    firacode_check=$(fc-list | grep "Fira Code Regular Nerd Font Complete.ttf")
    exa_check=$(whereis exa)
    power_level10k_check=$(ls -a $HOME/)
    dracula_theme_check=$(gsettings get org.gnome.desktop.interface gtk-theme)
    flatpak_apps_check=$(flatpak list)


    echo $password | sudo -S touch /etc/default/apport
    static_noise_check=$(ls /etc/modprobe.d)

    if [[ "$elixir_check" == *"/opt/elixir/bin"* ]]; then
        array[elixir]=$installed
    else
        array[elixir]=$not_installed
    fi

    if [[ "$phoenix_check" == *"phx_new"* ]]; then
        array[phoenix]=$installed
    else
        array[phoenix]=$not_installed
    fi

    if [[ "$postgresql_check" == *"/usr/bin/psql"* ]]; then
        array[postgresql]=$installed
    else
        array[postgresql]=$not_installed
    fi

    if [[ "$docker_check" == *"/etc/docker"* && 
        "$dockercompose_check" == *"/usr/bin/compose"* ]]; then
        array[docker]=$installed
    else 
        array[docker]=$not_installed
    fi

    if [[ "$git_check" == *"/usr/bin/git"*  ]]; then
        array[git]=$installed
    else
        array[git]=$not_installed
    fi

    if [[ "$node_check" == *"versions/node/"* ]]; then
        array[node]=$installed
    else
        array[node]=$not_installed
    fi

    if [[ "$zsh_check" == *"/usr/bin/zsh"* &&
        "$hyper_check" == *"/bin/hyper"* && 
        "$firacode_check" == *"Fira Code Regular Nerd Font"*  &&
        "$exa_check" == *".cargo/bin/exa"* && 
        "$power_level10k_check" == *".powerlevel10k"*
    ]]; then
        array[modern_terminal]=$installed
    else
        array[modern_terminal]=$not_installed
    fi

    if [[ "$dracula_theme_check" == *"Dracula"* ]]; then
        array[dracula_theme]=$installed
    else
        array[dracula_theme]=$not_installed
    fi

    if [[ "$flatpak_apps_check" == *"visualstudio"* ]]; then
        array[vscode]=$installed
    else
        array[vscode]=$not_installed
    fi

    if [[ "$flatpak_apps_check" == *"insomnia"* ]]; then
        array[insomnia]=$installed
    else
        array[insomnia]=$not_installed
    fi

    if [[ "$flatpak_apps_check" == *"dbeaver"* ]]; then
        array[dbeaver]=$installed
    else
        array[dbeaver]=$not_installed
    fi

    if [[ "$flatpak_apps_check" == *"obsidian"* ]]; then
        array[obsidian]=$installed
    else
        array[obsidian]=$not_installed
    fi
    if [[ "$flatpak_apps_check" == *"discord"* ]]; then
        array[discord]=$installed
    else
        array[discord]=$not_installed
    fi

    if [[ "$flatpak_apps_check" == *"telegram"* ]]; then
        array[telegram]=$installed
    else
        array[telegram]=$not_installed
    fi

    if [[ "$static_noise_check" == *"audio_disable_powersave.conf"* ]]; then
        array[static_noise]=$installed
    else
        array[static_noise]=$not_installed
    fi
}

checks
to_install=$(zenity --list \
    --checklist \
    --width 350 \
    --height 480 \
    --title "Apps Installer" \
    --text "<b>Choose apps to install</b>" \
    --column "" --column "Apps" --column "Installed?"\
    False "Elixir" "${array[elixir]}" \
    False "Phoenix" "${array[phoenix]}" \
    False "Postgres" "${array[postgresql]}" \
    False "Docker" "${array[docker]}" \
    False "Git" "${array[git]}" \
    False "Node" "${array[node]}" \
    False "Modern Terminal" "${array[modern_terminal]}" \
    False "Dracula Theme" "${array[dracula_theme]}" \
    False "VS Code" "${array[vscode]}" \
    False "Insomnia" "${array[insomnia]}" \
    False "DBeaver" "${array[dbeaver]}" \
    False "Obsidian" "${array[obsidian]}" \
    False "Discord" "${array[discord]}" \
    False "Telegram" "${array[telegram]}" \
    False "Static Noise" "${array[static_noise]}" \
    False "Remove Junk Apps" "" \
)

if [[ "$to_install" == *"Elixir"* ]]; then
    bash src/asdf_elixir.sh 
fi
if [[ "$to_install" == *"Phoenix"* ]]; then
    bash src/phoenix.sh 
fi
if [[ "$to_install" == *"Postgres"* ]]; then
    bash src/postgresql.sh 
fi
if [[ "$to_install" == *"Docker"* ]]; then
    bash src/docker.sh 
fi
if [[ "$to_install" == *"Git"* ]]; then
    bash src/git.sh 
fi
if [[ "$to_install" == *"Node"* ]]; then
    bash src/node.sh 
fi
if [[ "$to_install" == *"Modern Terminal"* ]]; then
    bash src/modern-terminal.sh 
fi
if [[ "$to_install" == *"Dracula Theme"* ]]; then
    bash src/dracula-theme.sh 
fi
if [[ "$to_install" == *"VS Code"* ]]; then
    bash src/vscode.sh 
fi
if [[ "$to_install" == *"Insomnia"* ]]; then
    bash src/insomnia.sh 
fi
if [[ "$to_install" == *"DBeaver"* ]]; then
    bash src/dbeaver.sh 
fi
if [[ "$to_install" == *"Obsidian"* ]]; then
    bash src/obsidian.sh 
fi
if [[ "$to_install" == *"Discord"* ]]; then
    bash src/discord.sh 
fi
if [[ "$to_install" == *"Telegram"* ]]; then
    bash src/telegram.sh 
fi
if [[ "$to_install" == *"Remove Junk Apps"* ]]; then
    bash src/remove-junk-apps.sh
fi

bash src/default-pack.sh
