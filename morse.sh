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

function convert_to_morse()
{
	text="$1"
	filename="$2"
        for ((i=0;i<${#text};i++)); do
       	c=${text:$i:1}
		c=${c^^}
		if test "$c" = " ";then
			printf '   ' | tee -a "$filename" 2> /dev/null
		else
			printf '%s ' "${morse[$c]}" | tee -a "$filename" 2> /dev/null
		fi
	done
	printf "\n" | tee -a "$filename" 2> /dev/null
}


if (("$#" == "0")); then
        echo "Usage: ./morse.sh [OPTION]..."
		echo ""
		echo "-h			help"
		echo "-t [FILENAME]		save output to chosen file"
		echo "-f [FILENAME]		read input from chosen file"
fi
filename=""
while (("$#" > 0)); do
        if test "$1" = "-h"; then
                echo "Usage: ./morse.sh [OPTION]..."
		echo ""
		echo "-h			help"
		echo "-t [FILENAME]		save output to chosen file"
		echo "-f [FILENAME]		read input from chosen file"
        elif test "$1" = "-t"; then
                shift
                filename="$1"
                printf '' | tee "$filename" 2> /dev/null   # clears the file
	elif test "$1" = "-f"; then
		shift
		if test -r "$1"; then
			input_from_file=$(cat "$1")
			convert_to_morse "$input_from_file" "$filename"
		else
			echo "Could not open the file"
			input_from_file=""
		fi
	elif test "$1" = "-c"; then
		shift
		c=$1
		c=${c^^}
		morse[$c]="$2"
		shift 2
	fi
        shift
done
read input_from_stdin
while test "$input_from_stdin" != ""; do
	convert_to_morse "$input_from_stdin" "$filename"
	read input_from_stdin
done
