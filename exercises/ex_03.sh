#!/bin/bash

if test $# -lt 2; then
	echo "You must provide at least 2 arguments!"
	exit 1
fi

N=$1
shift 1

LIBRARIES=""
for F in $@; do
  echo "File ${F}: "
	while read -r LINE; do
		if echo $LINE | grep -Eq "^(#include)"; then
			LIBRARIES+="$LINE"
			LIBRARIES+=" "
			echo "$LINE"
		fi
	done < $F
done

res=$(echo "${LIBRARIES}" | sort | uniq -c | sort -n -r -k 1,1 | head -n $N)
echo "Most $N used libraries are: $res"
