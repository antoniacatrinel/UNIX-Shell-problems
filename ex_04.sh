#!/bin/bash

if test $# -lt 2; then
	echo "You must provide at least 2 arguments!"
	exit 1
fi 

W=$1
shift 1

for F in $@; do
	COUNTWORD=$(cat $F | grep -Eo "$W" | wc -l)
	echo "File $F contains $COUNTWORD apparitions of given word."
done
