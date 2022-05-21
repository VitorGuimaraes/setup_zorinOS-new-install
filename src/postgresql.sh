#!/bin/bash

printf "\nInstalling PostgreSQL...\n\n"
sleep 1

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' 
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - 
sudo apt-get update 
sudo apt-get install postgresql-12 postgresql-client-12 postgresql-12 libpq-dev postgresql-server-dev-12 postgresql-contrib -y

clear
printf "=====================\n"
printf "PostgreSQL installed!\n"
printf "=====================\n"
psql --version 
printf "\nRun: \n"
printf "sudo -u postgres psql\n"
printf "In psql, type:\n"
printf "ALTER USER postgres WITH PASSWORD 'your_password';"
printf "\nquit\n\n"