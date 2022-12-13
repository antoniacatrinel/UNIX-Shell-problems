#!/bin/bash

USERS=$(cat last.fake | awk '{print $1}' | sort | uniq)

RES=""
for USER in $USERS; do
	SESSIONCOUNT=$(last | grep -Ec "^$USER")
	FULLNAME=$(cat /etc/passwd | grep -E "^${user}:" | awk -F ':' '{print $5}')
	RES+="$FULLNAME: $SESSIONCOUNT"$'\n'
done

RES=$(echo "$RES" | sort -n -r -k 1,1)
echo "$RES" 

