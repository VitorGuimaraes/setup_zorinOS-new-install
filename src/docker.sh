#!/bin/bash

printf "\nInstalling Docker...\n\n"
sleep 1

mkdir -p logs 
printf "" > logs/logs_docker.txt

printf "************************ $(date +"%D %T") ************************ 
→ sudo apt install ca-certificates curl gnupg lsb-release -y\n\n%s" \
| tee -a logs/logs_docker.txt
printf "$(sudo apt install ca-certificates curl gnupg lsb-release -y)" \
| tee -a logs/logs_docker.txt

printf "$(curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
| sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg)" \
| tee -a logs/logs_docker.txt

printf "\n************************ $(date +"%D %T") ************************ 
→ deb [arch=$(dpkg --print-architecture) \
signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\
| sudo tee /etc/apt/sources.list.d/docker.list > /dev/null \n" \
| tee -a logs/logs_docker.txt
printf "%s\n" "deb [arch=$(dpkg --print-architecture) \
signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
| sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

printf "\n************************ $(date +"%D %T") ************************ 
→ sudo apt update -y 2>&1\n%s" \
| tee -a logs/logs_docker.txt
printf "$(sudo apt update -y 2>&1)" \
| tee -a logs/logs_docker.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y 2>&1\n%s" \
| tee -a logs/logs_docker.txt
printf "$(sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y 2>&1)" \
| tee -a logs/logs_docker.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo docker run hello-world\n%s" \
| tee -a logs/logs_docker.txt
printf "$(sudo docker run hello-world)" \
| tee -a logs/logs_docker.txt


echo '{' >> $HOME/.docker/config.json
echo '\t"psFormat": "\\nName: \\t\\t{{.Names}}\\tCommand: {{.Command}}\\nNetworks: \\t{{.Networks}}\\nRunningFor: \\t{{.RunningFor}}\\nPorts: \\t\\t{{.Ports}}"' >> $HOME/.docker/config.json
echo '}' >> $HOME/.docker/config.json

docker_check=$(whereis docker)
dockercompose_check=$(whereis compose)
clear


if [[ "$docker_check" == *"/etc/docker"* ]]; then 
  printf "\n\n************************ $(date +"%D %T") ************************" \
  | tee -a logs/logs_docker.txt
  printf "\n→ docker --version\n" | tee -a logs/logs_docker.txt 
  printf "$(docker --version) \n" | tee -a logs/logs_docker.txt 
  printf "Docker installed!"
else 
  printf "Docker not installed! Check logs for errors...\n"
fi 

if [[ "$dockercompose_check" == *"/usr/bin/compose"* ]]; then
  printf "\n************************ $(date +"%D %T") ************************" \
  | tee -a logs/logs_docker.txt
  printf "\n→ docker compose version\n" | tee -a logs/logs_docker.txt 
  printf "$(docker compose version)\n" | tee -a logs/logs_docker.txt 
  printf "Docker Compose installed!"
else 
  printf "Docker Compose not installed! Check logs for errors...\n"
  sleep 2
fi 
printf "\n*******************************************************************\n"
