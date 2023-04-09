#!/bin/bash

printf "\nInstalling PostgreSQL...\n"

sudo sh -c 'echo "deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main" > /etc/apt/sources.list.d/PostgreSQL.list'


wget -q -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - 
sudo apt update -y
sudo apt install postgresql-12 postgresql-client-12 postgresql-12 libpq-dev postgresql-server-dev-12 postgresql-contrib -y

sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '2345meia78'"

postgresql_check=$(whereis psql)
clear

if [[ "$postgresql_check" == *"/usr/bin/psql"* ]]; then
    psql --version
    printf "PostgreSQL installed!\n" 
else
    printf "\nPostgreSQL not installed!"
fi
printf "\n*******************************************************************\n"