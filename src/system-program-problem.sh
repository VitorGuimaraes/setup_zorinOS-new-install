#!/bin/bash

printf "\nFixing System Program Problem Detected...\n"
sleep 1

mkdir -p logs 
printf "" > logs/logs_system_program_problem_detected.txt

printf "************************ $(date +"%D %T") ************************
→ sudo sed -i 's/enabled=.*/enabled=0/' /etc/default/apport &\n\n%s" \
"$(sudo sed -i 's/enabled=.*/enabled=0/' /etc/default/apport &)" \
| tee -a logs/logs_system_program_problem_detected.txt

system_program_problem_detected_check=$(cat /etc/default/apport | grep "enabled")
clear

if [[ "$system_program_problem_detected_check" == *"enabled=0"* ]]; then
    printf "************************ $(date +"%D %T") ************************\n" \
    | tee -a logs/logs_system_program_problem_detected.txt
    printf "$(cat /etc/default/apport)" \
    | tee -a logs/logs_system_program_problem_detected.txt 
    printf "\n\nSystem Program Problem Detected fixed!"
else
    printf "\nSystem Program Problem Detected not fixed! Check logs for errors..."
    sleep 2
fi
printf "\n*******************************************************************\n"