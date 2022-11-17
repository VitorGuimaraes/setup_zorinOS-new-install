#!/bin/bash

printf "\nInstalling Simple Screen Recorder...\n\n"
sleep 1

mkdir -p logs 
printf "" > logs/logs_screen_recorder.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
→ sudo apt install pavucontrol simplescreenrecorder -y\n\n%s" \
| tee -a logs/logs_screen_recorder.txt
printf "$(sudo apt install pavucontrol simplescreenrecorder -y)" \
| tee -a logs/logs_screen_recorder.txt

# unload modules if already loaded
pactl unload-module module-loopback
pactl unload-module module-null-sink  

# load modules
pactl load-module module-null-sink sink_name=duplex_out sink_properties=device.description="mic+sound"
pactl load-module module-loopback sink=duplex_out
pactl load-module module-loopback sink=duplex_out

simplescreenrecorder_check=$(whereis simplescreenrecorder)
clear

if [[ "$simplescreenrecorder_check" == *"/usr/bin/simplescreenrecorder"* ]]; then

    printf "\n\n************************ $(date +"%D %T") ************************" \
    | tee -a logs/logs_screen_recorder.txt

    printf "\n→ $(simplescreenrecorder --version)\n" | tee -a logs/logs_phoenix.txt 
    printf "Simple Screen Recorder installed!\n" | tee -a logs/logs_screen_recorder.txt 

    printf "\n→ In pavucontrol → Recording, see All Streams and \n"
    printf "set a loopback to *Monitor of Built-in Audio Analog Stereo* \n"
    printf "and other to *Built-in Audio Analog Stereo*. \n"
    printf "In Simple Screen Recorder, set the microphone to *Monitor of mic+sound*\n" | tee -a logs/logs_screen_recorder.txt 
    printf "*******************************************************************" | tee -a logs/logs_screen_recorder.txt 

else
    printf "\nSimple Screen Recorder not installed! Check logs for errors..."
    sleep 2
fi
printf "\n*******************************************************************\n"
