#!/bin/bash
MIN_VAL=1
MAX_VAL=100
INT=500

if [[ "$INT" =~ ^-?[0-9]+$ ]]; then
	if [[ INT -ge MIN_VAL && INT -le MAX_VAL ]]; then
		echo "$INT is within $MIN_VAL to $MAX_VAL."
	elif [[ ! ( INT -ge MIN_VAL && INT -le MAX_VAL ) ]]; then
		echo "$INT is out of range."
	else
		echo "This is not possible"
	fi
else
	echo "INT is not an integer." >&2
	exit 1
fi