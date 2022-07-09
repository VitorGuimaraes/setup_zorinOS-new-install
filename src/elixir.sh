#!/bin/bash

# In case of errors, try install manually:

# erlang-solutions: https://www.erlang-solutions.com/downloads/
# sudo apt-get install esl-erlang=1:25.0-1
# https://elixirforum.com/t/installing-erlang-elixir-on-ubuntu-20-04-is-failing-esl-erlang-25-0-2-1-ubuntu-focal-amd64-deb-file-has-unexpected-size/48754

# sudo apt update -y
# esl-erlang: http://binaries.erlang-solutions.com/debian/pool/
# elixir: sudo apt install elixir 

printf "\nInstalling Elixir...\n\n"
sleep 1

mkdir -p logs 
printf "" > logs/logs_elixir.txt

printf "************************ $(date +"%D %T") ************************ 
→ wget -q https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb\n\n%s" \
"$(wget -q https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb 2>&1)" \
| tee -a logs/logs_elixir.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo dpkg -i erlang-solutions_2.0_all.deb\n\n%s" \
"$(sudo dpkg -i erlang-solutions_2.0_all.deb)" \
| tee -a logs/logs_elixir.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo apt update -y \n\n%s" \
"$(sudo apt update -y)" \
| tee -a logs/logs_elixir.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo apt install esl-erlang elixir -y\n\n%s" \
"$(sudo apt install esl-erlang elixir -y)" \
| tee -a logs/logs_elixir.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo rm -v erlang-solutions_2.0_all.deb \n%s" \
"$(sudo rm -v erlang-solutions_2.0_all.deb)" \
| tee -a logs/logs_elixir.txt


elixir_check=$(whereis elixir)
clear

if [[ "$elixir_check" == *"/usr/bin/elixir"* ]]; then
    printf "\n\n************************ $(date +"%D %T") ************************" \
    | tee -a logs/logs_elixir.txt
    printf "\n→ elixir --version\n" | tee -a logs/logs_elixir.txt 
    printf "$(elixir --version) \n" | tee -a logs/logs_elixir.txt 
    printf "Elixir installed!"
else
    printf "Elixir not installed! Check logs for errors..."
    sleep 2
fi
printf "\n*******************************************************************\n"