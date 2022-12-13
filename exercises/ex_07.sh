#!/bin/bash

if test $# -lt 2; then
	echo "You must provide at least 2 arguments!"
	exit 1
fi

N=$1
shift 1

for F in $@; do
	WORDS=$(cat "$F" | tr ' ' '\n' | sort | uniq -c | sort -n -r -k 1,1 | awk -v n=$N '{ if($1>n) print $1, $2 }')
	echo "File $F:"
	echo "Words that have frequency greater than $N: $WORDS"
done
