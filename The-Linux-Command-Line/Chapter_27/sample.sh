#!/bin/bash

val=5					# = should not have space around it
if [ $val -eq 5 ]; then	# single space around and inside [ ]  are mandatory
	echo "It is 5"
else
	echo "It is not 5"
fi

# It is 5