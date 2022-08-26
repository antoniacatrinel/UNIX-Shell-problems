#!/bin/bash

if test $# -eq 0; then
	echo "You must provide at least 1 argument!"
	exit 1
fi

while true; do
	for PROGRAM in $@; do
		PROCESSES=$(cat ps.fake | awk '{print $1}' | grep -Eo "^$PROGRAM$")
		if test -n $PROCESSES; then  # non-zero string
			kill -9 $PROCESSES
			echo "Killed program $PROGRAM."
		fi
	echo "Waiting"
	sleep(1)
	done
done
