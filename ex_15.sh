#!/bin/bash

if test $# -ne 1; then
	echo "You must provide exactly 1 argument!"
	exit 1
fi

for F in $(find $1 -type f); do
	PERMISSIONS="$(ls -l $F | awk '{print $1}' | grep -Eo "^........w.$")"
	if test -n "$PERMISSIONS"; then
		echo "File: $F"
		BEFORE=$(ls -l $F | awk '{print $1}')
		echo "Before permissions: $BEFORE"
		chmod o-w "$F"
		AFTER=$(ls -l $F | awk '{print $1}')
		echo "After permissions: $AFTER"
	fi
done
