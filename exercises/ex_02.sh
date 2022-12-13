#!/bin/bash

if test $# -lt 4; then
	echo "You must provide at least 4 arguments!"
	exit 1
fi

W=$1
M=$2
N=$3
shift 3

for F in $@; do
	NTHLINE=$(cat $F | tail -n +$N | head -n 1)
	COUNTWORD=$(echo "$NTHLINE" | grep -Eo "$W" | wc -l)
	
	if test $COUNTWORD -ge $M; then
		echo $F 
	fi
done
