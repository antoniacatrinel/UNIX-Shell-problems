#!/bin/bash

if test $# -lt 1; then
	echo "You must provide at least 1 argument!"
	exit 1
fi

for F in $@; do
	echo "File $F:"
    NUMBERS=$(cat "$F" | grep -Po '(?<!\d)\d*[02468](?!\d)' | sort -n | uniq -c | sort -n -r -k 1,1)
    echo "Frequency of even numbers: $NUMBERS"
done
