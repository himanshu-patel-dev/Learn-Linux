#!/bin/bash

clear
echo "
Please Select:
1. Display System Information
2. Display Disk Space
3. Display Home Space Utilization
0. Quit
"

read -p "Enter selection [0-3] > "

if [[ $REPLY =~ ^[0-3]$ ]]; then
	if [[ $REPLY == 0 ]]; then
		echo "Program terminated."
		exit
	fi
	# hostname
	if [[ $REPLY == 1 ]]; then
		echo "Hostname: $HOSTNAME"
		uptime
		exit
	fi
	# disk space
	if [[ $REPLY == 2 ]]; then
		df -h
		exit
	fi
	# home space utilization
	if [[ $REPLY == 3 ]]; then
		if [[ $(id -u) -eq 0 ]]; then
			echo "Home Space Utilization (All Users)"
			du -sh /home/*
		else
			echo "Home Space Utilization ($USER)"
			du -sh $HOME
		fi
		exit
	fi
else 
	echo "Invalid entry." >&2
	exit 1
fi