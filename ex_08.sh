#!/bin/bash

if test $# -lt 3; then
	echo "You must provide at least 3 arguments!"
	exit 1
fi

N=$1
W=$2
shift 2

for FILE in $@; do
	WORDCOUNT=$(cat $FILE | grep -Ec "$W")
	if test $WORDCOUNT -lt $N; then
		echo "Word $W appears less then $n times in file $FILE."
	else
		WAPPARITIONS=$(cat $FILE | grep -E "$W")
		NTHLINE=$(echo "$WAPPARITIONS" | tail -n +"$N" | head -n 1)
		echo $NTHLINE
	fi
done
