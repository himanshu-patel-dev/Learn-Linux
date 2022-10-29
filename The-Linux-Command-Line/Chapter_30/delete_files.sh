#!/bin/bash

dir_name="/home/himanshu/HP/temp"

if [[ -d $dir_name ]]; then
	if cd $dir_name; then
		echo rm * # this will print all selected files for deletion
		# rm *
	else
		echo "cannot cd to '$dir_name'" >&2
		exit 1
		fi
else
	echo "no such directory: '$dir_name'" >&2
	exit 1
fi
exit 0

