#!/bin/bash

if test $# -ne 1; then
	echo "You must provide exactly 1 argument!"
	exit 1
fi

for F in $(find $1 -type l); do
	if test -L $F; then
		if ! test -e $F; then
			echo $F
		fi
	fi 
done
