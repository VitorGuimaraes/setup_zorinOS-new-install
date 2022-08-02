#!/bin/bash

printf "\nInstalling Dev Icons...\n\n"
sleep 1

mkdir -p logs 
printf "" > logs/logs_dev_icons.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo cp -v DevIcons/dockerfile.xml /usr/share/mime/packages\n\n%s" \
"$(sudo cp -v DevIcons/dockerfile.xml /usr/share/mime/packages)" \
| tee -a logs/logs_dev_icons.txt

dest="/usr/share/icons/Zorin/16x16/mimetypes    /usr/share/icons/Zorin/24x24/mimetypes 
	  /usr/share/icons/Zorin/16x16@2x/mimetypes /usr/share/icons/Zorin/24x24@2x/mimetypes
      /usr/share/icons/Zorin/32x32/mimetypes    /usr/share/icons/Zorin/48x48/mimetypes
      /usr/share/icons/Zorin/32x32@2x/mimetypes /usr/share/icons/Zorin/48x48@2x/mimetypes
      /usr/share/icons/Zorin/512x512/mimetypes  /usr/share/icons/Zorin/512x512@2x/mimetypes"

printf "\n\n************************ $(date +"%D %T") ************************ 
→ echo $dest | xargs -n 1 sudo cp -v DevIcons/icons/text-x-script.png\n\n%s" \
"$(echo $dest | xargs -n 1 sudo cp -v DevIcons/icons/text-x-script.png)" \
| tee -a logs/logs_dev_icons.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ echo $dest | xargs -n 1 sudo cp -v DevIcons/icons/text-html.png\n\n%s" \
"$(echo $dest | xargs -n 1 sudo cp -v DevIcons/icons/text-html.png)" \
| tee -a logs/logs_dev_icons.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ echo $dest | xargs -n 1 sudo cp -v DevIcons/icons/text-x-matlab.png\n\n%s" \
"$(echo $dest | xargs -n 1 sudo cp -v DevIcons/icons/text-x-matlab.png)" \
| tee -a logs/logs_dev_icons.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo cp -v DevIcons/icons/*.svg /usr/share/icons/hicolor/scalable/mimetypes\n\n%s" \
"$(sudo cp -v DevIcons/icons/*.svg /usr/share/icons/hicolor/scalable/mimetypes)" \
| tee -a logs/logs_dev_icons.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo gtk-update-icon-cache /usr/share/icons/hicolor/ -f\n\n%s" \
"$(sudo gtk-update-icon-cache /usr/share/icons/hicolor/ -f)" \
| tee -a logs/logs_dev_icons.txt

clear