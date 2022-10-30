#!/bin/bash

read -p "Enter Word > "

case $REPLY in
	[[:alpha:]]) 	echo "is a single alpha character" ;;
	[ABC][0-9])		echo "is A, B, or C followed by a digit." ;;
	???)			echo "is three characters long." ;;
	*.txt)			echo "is a word ending in '.txt'" ;;
	*)				echo "is something else." ;;
esac
