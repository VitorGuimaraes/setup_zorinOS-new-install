#!/bin/bash

printf "\nInstalling Dev Icons...\n\n"
sleep 1

mkdir -p logs 
printf "" > logs/logs_dev_icons.txt

# Copy xml files
sudo cp -v DevIcons/*.xml /usr/share/mime/packages

# copy png and svg files
count=0
for directory in /usr/share/icons/*/*/; do 
	if [[ "$directory" == *"x"* ]]; then
		for file in DevIcons/*.png; do
			sudo cp -v $file $directory
			count=$((count+1))
		done

	elif [[ "$directory" == *"scalable"* ]]; then
		for file in DevIcons/*.svg; do
			sudo cp -v $file $directory
			count=$((count+1))
		done
	fi
done
echo $count

# update icon-cache
for directory in /usr/share/icons/*/; do 
    sudo gtk-update-icon-cache $directory
done

# update mime-database
sudo update-mime-database /usr/share/mime

# clear

printf "************************ $(date +"%D %T") ************************"
printf "\nDev Icons installed!"
printf "\n*******************************************************************\n"