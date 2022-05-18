#!/bin/bash

sudo apt install paper-icon-theme -y

sudo cp -v PaperThemeDevIcons/dockerfile.xml /usr/share/mime/packages

dest="/usr/share/icons/Paper/16x16/mimetypes    /usr/share/icons/Paper/24x24/mimetypes 
      /usr/share/icons/Paper/16x16@2x/mimetypes /usr/share/icons/Paper/24x24@2x/mimetypes
      /usr/share/icons/Paper/32x32/mimetypes    /usr/share/icons/Paper/48x48/mimetypes
      /usr/share/icons/Paper/32x32@2x/mimetypes /usr/share/icons/Paper/48x48@2x/mimetypes
      /usr/share/icons/Paper/512x512/mimetypes  /usr/share/icons/Paper/512x512@2x/mimetypes"

echo $dest | xargs -n 1 sudo cp -v PaperThemeDevIcons/icons/text-x-script.png
echo $dest | xargs -n 1 sudo cp -v PaperThemeDevIcons/icons/text-html.png
echo $dest | xargs -n 1 sudo cp -v PaperThemeDevIcons/icons/text-x-matlab.png

sudo cp -v PaperThemeDevIcons/icons/*.svg /usr/share/icons/hicolor/scalable/mimetypes

sudo gtk-update-icon-cache /usr/share/icons/hicolor/ -f

printf "\n\n=========================================="
printf "\nDone! Logout and login to apply changes :D\n"
echo "=========================================="