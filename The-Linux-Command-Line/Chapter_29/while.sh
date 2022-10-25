#!/bin/bash

count=1

while [[ $count -le 7 ]]; do
	if [[ $count -eq 3 ]]; then
		count=$((count + 1))
		continue
	elif [[ $count -eq 5 ]]; then
		break
	fi	
	echo $count
	count=$((count + 1))
done
echo "Done"

# 1
# 2
# 4
# Done