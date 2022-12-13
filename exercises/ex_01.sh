#!/bin/bash

if test $# -lt 1; then
	echo "You must provide at least 1 argument!"
	exit 1
fi

COUNT=0
for DIR in $@; do
	for F in $(find $DIR -type f -name "*.c"); do
		((COUNT++))
	done 
done

echo "There are $COUNT C files in given directories"
