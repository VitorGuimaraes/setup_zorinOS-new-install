#!/bin/bash

# Uninstall any outdated git
sudo apt purge git -y

git_check=$(whereis git)
if [[ "$git_check" != *"/usr/bin/git"* ]]; then
    bash src/git.sh
fi

# Install dash-to-panel gnome extension
sudo apt install gnome-shell-extension-manager
# Run Extension Manager; Browse 'Dash to Panel' ordered by Downloads

# Install noannoyance gnome extension (fix 'window is ready')
git clone git@github.com:bdaase/noannoyance.git
mv noannoyance $HOME/.local/share/gnome-shell/extensions/noannoyance@daase.net
# Need logout and login again for have effect

# Install Poppins font
find Poppins/ -type f -print0 | xargs -0 cp -t $HOME/.local/share/fonts

# Set night light
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-from 22
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-to 21.98
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 2700

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# Hide snap folder
echo snap >> $HOME/.hidden

apps_check=$(flatpak list)

# Install apps
chrome_check=$(whereis google-chrome)
if [[ "$chrome_check" != *"/usr/bin/google-chrome"* ]]; then
    bash src/chrome.sh
fi

flameshot_check=$(whereis flameshot)
if [[ "$flameshot_check" != *"/usr/bin/flameshot"* ]]; then
    sudo apt install flameshot -y
fi

if [[ "$apps_check" != *"qBittorrent"* ]]; then
    flatpak install flathub org.qbittorrent.qBittorrent -y
fi

if [[ "$apps_check" != *"VLC"* ]]; then
    flatpak install flathub org.videolan.VLC -y
fi

if [[ "$(whereis simplescreenrecorder)" != *"/usr/bin/simplescreenrecorder"* ]]; then
    sudo apt install simplescreenrecorder -y
fi

if [[ "$(whereis fdfind)" != *"/usr/bin/fdfind"* ]]; then
    sudo apt install fd-find -y
fi

if [[ "$(whereis batcat)" != *"/usr/bin/batcat"* ]]; then
    sudo apt install bat -y
fi

if [[ "$(whereis rg)" != *"/usr/bin/rg"* ]]; then
    sudo apt install ripgrep -y
fi

if [[ "$(whereis micro)" != *"/usr/bin/micro"* ]]; then
    sudo apt install micro -y
fi

if [[ "$(whereis bashtop)" != *"/usr/bin/bashtop"* ]]; then
    sudo add-apt-repository --yes ppa:bashtop-monitor/bashtop
    sudo apt update -y
    sudo apt install bashtop -y
fi

if [[ "$(whereis tldr)" != *"/bin/tldr"* ]]; then
    if [[ "$(whereis node)" != *"versions/node/"* ]]; then
        bash src/node.sh
    fi
    npm install -g tldr
fi

sudo apt install dconf-editor -y
sudo apt install gnome-shell-extension-manager -y

# Set keyboard shortcuts
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings \
"[ \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/flameshot/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/vscode/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/dbeaver/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/insomnia/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/obsidian/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/discord/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/google/'  \
]"

gsettings set org.gnome.shell.keybindings screenshot "[]"
gsettings set org.gnome.shell.keybindings screenshot-window "[]"
gsettings set org.gnome.shell.keybindings show-screenshot-ui "[]"
gsettings set org.gnome.shell.keybindings show-screen-recording-ui "[]"
gsettings set org.gnome.shell.keybindings toggle-message-tray "[]" 
gsettings set org.gnome.shell.keybindings toggle-application-view "[]" 
gsettings set org.gnome.settings-daemon.plugins.media-keys calculator "['<Super>c']" 
gsettings set org.gnome.settings-daemon.plugins.media-keys www "['<Super>f']" 

# Remove shortcuts to move to workspaces(so don't conflict with vscode copyline shortcuts)
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "[]" 
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "[]" 

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/flameshot/ name 'Flameshot'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/flameshot/ command 'flameshot gui'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/flameshot/ binding 'Print'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/vscode/ name 'VSCode'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/vscode/ command 'code'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/vscode/ binding '<Super>V'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/dbeaver/ name 'DBeaver'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/dbeaver/ command 'flatpak run io.dbeaver.DBeaverCommunity'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/dbeaver/ binding '<Super>B'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/insomnia/ name 'Insomnia'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/insomnia/ command 'flatpak run rest.insomnia.Insomnia'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/insomnia/ binding '<Super>I'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/obsidian/ name 'Obsidian'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/obsidian/ command 'flatpak run md.obsidian.Obsidian'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/obsidian/ binding '<Super>O'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/discord/ name 'Discord'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/discord/ command 'flatpak run com.discordapp.Discord'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/discord/ binding '<Super>D'
