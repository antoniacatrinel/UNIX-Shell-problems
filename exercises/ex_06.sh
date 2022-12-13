#!/bin/bash

if test $# -lt 2; then
	echo "You must provide at least 2 arguments!"
	exit 1
fi

FILENAME=$1
shift 1

AVAILABLEUSERS=$(cat '/etc/passwd' | awk -F: '{print $1}')

for USER in $@; do
	FOUNDDIRS=""
	ok=1
	if cat '/etc/passwd' | grep -Eq "^$USER"; then
		HOMEDIR=$(cat '/etc/passwd' | grep -E "^$USER" | awk -F: '{print $6}')
		if ! test -r "$HOMEDIR"; then
			ok=0
			echo "No permissions to access home directory of user $USER."
		else
			for DIR in $(cat $FILENAME); do
				for DIRECTORY in $(find $HOMEDIR -type d); do
					if echo $DIRECTORY | grep -Eq "$DIR"; then
						FOUNDDIRS+="$DIR"$'\n'
					fi
				done	
			done 
		fi
	fi
	if test $ok -eq 1; then
		echo "User $USER:"
		FOUNDDIRS=$(echo "$FOUNDDIRS" | sort -u)
    	echo $FOUNDDIRS
	fi
done

