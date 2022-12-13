#!/bin/bash

if test $# -ne 1; then
	echo "You must provide exactly 1 argument!"
	exit 1
fi

USERNAMES=$(cat $1 | awk '{print $1}')
USERCOUNT=$(echo $USERNAMES | wc -w)

EMAILS=""
for USERNAME in $USERNAMES; do
	((USERCOUNT--))
	EMAILS+="${USERNAME}@yahoo.ro"
	if test $USERCOUNT -ge 1; then
		EMAILS+=","
	fi
done
echo "$EMAILS"
