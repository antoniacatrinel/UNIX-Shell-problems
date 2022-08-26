#!/bin/bash

if test $# -ne 1; then
	echo "You must provide only 1 argument!"
	exit 1
fi

for F in $(find $1 -type f -name "*.log"); do
	sort $F -o $F
done
