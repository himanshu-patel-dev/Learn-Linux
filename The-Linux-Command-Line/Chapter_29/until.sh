#!/bin/bash

count=1

until [[ $count -gt 5 ]]; do
	echo $count
	count=$((count + 1))
done
echo "Done"

# 1
# 2
# 3
# 4
# 5
# Done
