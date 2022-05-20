#!/bin/bash

printf "\nInstalling Docker...\n"
sleep 1

# Install packages to allow apt to use a repository over HTTPS:
sudo apt install ca-certificates curl gnupg lsb-release -y

# Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg -y

# Set up the stable repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine:
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

sudo docker run hello-world

clear 
docker --version
docker compose version
printf "===================================="
printf "\nDocker and Docker Compose installed!"
printf "\n====================================\n\n"