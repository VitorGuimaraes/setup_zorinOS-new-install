#!/bin/bash

printf "\nInstalling PostgreSQL...\n\n"
sleep 1

mkdir -p logs 
printf "" > logs/logs_postgresql.txt

printf "************************ $(date +"%D %T") ************************ 
→ echo 'deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main'
| sudo tee /etc/apt/sources.list.d/pgdg.list %s" \
| tee -a logs/logs_postgresql.txt
printf "%s\n" "deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" \
| sudo tee /etc/apt/sources.list.d/pgdg.list

printf "\n\n************************ $(date +"%D %T") ************************ 
→ wget -q -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - \n\n %s" \
| tee -a logs/logs_postgresql.txt
printf "$(wget -q -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -  2>&1)" \
| tee -a logs/logs_postgresql.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo apt update -y\n\n%s" \
| tee -a logs/logs_postgresql.txt
printf "$(sudo apt update -y)" \
| tee -a logs/logs_postgresql.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo apt install postgresql-12 postgresql-client-12 postgresql-12 libpq-dev \
postgresql-server-dev-12 postgresql-contrib -y\n\n%s" \
| tee -a logs/logs_postgresql.txt
printf "$(sudo apt install postgresql-12 postgresql-client-12 postgresql-12 libpq-dev \
postgresql-server-dev-12 postgresql-contrib -y)" \
| tee -a logs/logs_postgresql.txt


postgresql_check=$(whereis psql)
clear

if [[ "$postgresql_check" == *"/usr/bin/psql"* ]]; then

    printf "\n\n************************ $(date +"%D %T") ************************" \
    | tee -a logs/logs_postgresql.txt
    printf "\n→ psql --version\n" | tee -a logs/logs_postgresql.txt 
    printf "$(psql --version) \n" | tee -a logs/logs_postgresql.txt 

    printf "PostgreSQL installed!\n" | tee -a logs/logs_postgresql.txt 
    printf "*******************************************************************" | tee -a logs/logs_postgresql.txt 
    printf "\nRun: \n"               | tee -a logs/logs_postgresql.txt 
    printf "sudo -u postgres psql\n" | tee -a logs/logs_postgresql.txt 
    printf "In psql, type:\n"        | tee -a logs/logs_postgresql.txt 
    printf "ALTER USER postgres WITH PASSWORD 'your_password';" | tee -a logs/logs_postgresql.txt 
    printf "\nquit" | tee -a logs/logs_postgresql.txt 
else
    printf "\nPostgreSQL not installed! Check logs for errors..."
    sleep 2
fi
printf "\n*******************************************************************\n"