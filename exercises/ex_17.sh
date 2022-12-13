#!/bin/bash

if test $# -ne 1; then
	echo "You must provide exactly 1 argument!"
	exit 1
fi

CHECKSUMS=()

for F in $(find $1 -type f); do
	ok=0
	CURRENTCHECKSUM=$(md5sum $F | awk '{print $1}')
	for CHECKSUM in ${CHECKSUMS[@]}; do
		if [ "$CURRENTCHECKSUM" == "$CHECKSUM" ]; then
			ok=1
			echo "File $F with checksum $CURRENTCHECKSUM"
		fi
	done
	if [ $ok -eq 0 ]; then
		CHECKSUMS+=($CURRENTCHECKSUM)
	fi
done
