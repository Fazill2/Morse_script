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
morse[F]='..-.'
morse[G]='--.'
morse[H]='....'
morse[I]='..'
morse[J]='.---'
morse[K]='-.-'
morse[L]='.-..'
morse[M]='--'
morse[N]='-.'
morse[O]='---'
morse[P]='.--.'
morse[Q]='--.-'
morse[R]='.-.'
morse[S]='...'
morse[T]='-'
morse[U]='..-'
morse[V]='...-'
morse[X]='-..-'
morse[Y]='-.--'
morse[Z]='--..'

########


if (("$#" == "0")); then
        echo "help"
        exit
fi

while (("$#" > 0)); do
        if test "$1" = "-h"; then
                echo "help"
                echo "$1"
        elif test "$1" = "-f"; then
                shift
                echo "$1"
        else
                foo="$1"
                for ((i=0;i<${#foo};i++)); do
                        c=${foo:$i:1}
                        c=${c^^}
                        if test "$c" = " ";then
                                printf '       '
                        else
                                printf '%s ' "${morse[$c]}"
                        fi
                done
                printf "\n"
        fi
        shift
done
