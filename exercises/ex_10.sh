#!/bin/bash

USERNAMES=$(who | awk '{print $1}')
for USER in $USERNAMES; do
	PROCESSES=$(ps -Af | grep -Eo "^$USER.*" | wc -l)
	FULLNAME=$(cat /etc/passwd | grep -E "^${USER}:" | awk -F ':' '{print $5}')
	echo "$FULLNAME is running $PROCESSES processes."
done
