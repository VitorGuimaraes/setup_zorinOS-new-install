#!/bin/bash

printf "\nInstalling Paper Theme With Dev Icons...\n\n"
sleep 1

mkdir -p logs 
printf "" > logs/logs_paper_theme.txt

printf "************************ $(date +"%D %T") ************************ 
→ sudo apt install paper-icon-theme -y\n\n%s" \
"$(sudo apt install paper-icon-theme -y)" \
| tee -a logs/logs_paper_theme.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo cp -v ../PaperThemeDevIcons/dockerfile.xml /usr/share/mime/packages\n\n%s" \
"$(sudo cp -v ../PaperThemeDevIcons/dockerfile.xml /usr/share/mime/packages)" \
| tee -a logs/logs_paper_theme.txt

dest="/usr/share/icons/Paper/16x16/mimetypes    /usr/share/icons/Paper/24x24/mimetypes 
	  /usr/share/icons/Paper/16x16@2x/mimetypes /usr/share/icons/Paper/24x24@2x/mimetypes
      /usr/share/icons/Paper/32x32/mimetypes    /usr/share/icons/Paper/48x48/mimetypes
      /usr/share/icons/Paper/32x32@2x/mimetypes /usr/share/icons/Paper/48x48@2x/mimetypes
      /usr/share/icons/Paper/512x512/mimetypes  /usr/share/icons/Paper/512x512@2x/mimetypes"

printf "************************ $(date +"%D %T") ************************ 
→ echo $dest | xargs -n 1 sudo cp -v PaperThemeDevIcons/icons/text-x-script.png\n\n%s" \
"$(echo $dest | xargs -n 1 sudo cp -v PaperThemeDevIcons/icons/text-x-script.png)" \
| tee -a logs/logs_paper_theme.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ echo $dest | xargs -n 1 sudo cp -v PaperThemeDevIcons/icons/text-html.png\n\n%s" \
"$(echo $dest | xargs -n 1 sudo cp -v PaperThemeDevIcons/icons/text-html.png)" \
| tee -a logs/logs_paper_theme.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ echo $dest | xargs -n 1 sudo cp -v PaperThemeDevIcons/icons/text-x-matlab.png\n\n%s" \
"$(echo $dest | xargs -n 1 sudo cp -v PaperThemeDevIcons/icons/text-x-matlab.png)" \
| tee -a logs/logs_paper_theme.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo cp -v ../PaperThemeDevIcons/icons/*.svg /usr/share/icons/hicolor/scalable/mimetypes\n\n%s" \
"$(sudo cp -v ../PaperThemeDevIcons/icons/*.svg /usr/share/icons/hicolor/scalable/mimetypes)" \
| tee -a logs/logs_paper_theme.txt

printf "************************ $(date +"%D %T") ************************ 
→ sudo gtk-update-icon-cache /usr/share/icons/hicolor/ -f\n\n%s" \
"$(sudo gtk-update-icon-cache /usr/share/icons/hicolor/ -f)" \
| tee -a logs/logs_paper_theme.txt

printf "************************ $(date +"%D %T") ************************ 
→ xfconf-query -c xsettings -p /Net/IconThemeName -s 'Paper'\n\n%s" \
"$(xfconf-query -c xsettings -p /Net/IconThemeName -s 'Paper')" \
| tee -a logs/logs_paper_theme.txt


paper_theme_check=$(ls /usr/share/icons | grep Paper)
clear

if [[ "$paper_theme_check" == *"Paper"* ]]; then
    printf "************************ $(date +"%D %T") ************************" \
    | tee -a logs/logs_paper_theme.txt
	printf "\n→ aptitude versions paper-icon-theme\n" | tee -a logs/logs_paper_theme.txt 
    printf "$(aptitude versions paper-icon-theme) \n" | tee -a logs/logs_paper_theme.txt 
    printf "Paper Icon Theme installed!"
else
    printf "Paper Icon Theme not installed! Check logs for errors..."
    sleep 2
fi
printf "\n*******************************************************************\n"