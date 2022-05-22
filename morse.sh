#!/usr/bin/env bash

########
declare -A morse
morse[0]='-----'
morse[1]='.----'
morse[2]='..---'
morse[3]='...--'
morse[4]='....-'
morse[5]='.....'
morse[6]='-....'
morse[7]='--...'
morse[8]='---..'
morse[9]='----.'
morse[A]='.-'
morse[B]='-...'
morse[C]='-.-.'
morse[D]='-..'
morse[E]='.'

########

if (("$#" == "0")); then
        echo "help"
        exit
fi

while (("$#" > 0)); do
        if (($1 == "-h")); then
                echo "help";
        fi
        shift
done
