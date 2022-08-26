#!/bin/bash

if test $# -ne 1; then
	echo "You must provide only 1 argument!"
	exit 1
fi

COUNT=0
for F in $(find $1 -type f -name "*.c"); do
	LINECOUNT=$(wc -l $F | awk '{print $1}')
	if test $LINECOUNT -gt 500; then
		echo $F
		((COUNT++))
	fi
	if test $COUNT -ge 2; then
		break
	fi
done
