#!/bin/bash

COUNT=0
while read -r LINE; do
	((COUNT++))
	if test $COUNT -gt 1; then
		SIZE=$(echo $LINE | awk '{print $2}')
		USAGE=$(echo $LINE | awk '{print $5}')
  	ACTUALSIZE=$(echo $SIZE | sed 's/.$//')
		ACTUALUSAGE=$(echo $USAGE | sed 's/.$//')
		if [ $ACTUALSIZE -lt 1000 ] || [ $ACTUALUSAGE -lt 20 ]; then
			FILENAME=$(echo $LINE | awk '{print $6}')
			echo $FILENAME
		fi
	fi
done < "df.fake"

