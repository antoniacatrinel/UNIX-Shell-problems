#!/bin/bash

if test $# -lt 3; then
	echo "You must provide at least 3 arguments!"
	exit 1
fi

F1=$1
F2=$2
shift 2

AVAILABLEUSERS=""
AVAILABLEUSERS+="$(cat "/etc/passwd" | awk -F: '{print $1}')"

RESULT=""
for USER in $@; do
	ok=0
	for CURRENTUSER in ${AVAILABLEUSERS[@]}; do
		if test "$USER" == "$CURRENTUSER"; then
			ok=1
		fi
	done
	if test $ok -eq 0; then
		echo "$USER" >> $F2
	fi 
	if test $ok -eq 1; then
        USERNAME=$(cat "/etc/passwd" | grep -E "^$USER" | awk -F: '{print $5}')
		HOMEDIR=$(cat "/etc/passwd" | grep -E "^$USER" | awk -F: '{print $6}')
		SIZEOFHOMEDIR=$(du -bs $HOMEDIR | awk '{print $1}')
		RESULT+="$USERNAME $SIZEOFHOMEDIR"$'\n'
 	fi
done

RESULT=$(echo $RESULT | sort -r -k 2)
echo "$RESULT" >> $F2
