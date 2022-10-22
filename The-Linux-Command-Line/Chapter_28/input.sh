#!/bin/bash

# read string in defult variable
read -p "Enter String > "
echo "Single String Input -> $REPLY"

# read array 
read -p "Enter Array > " -a  ARRAY
for ele in ${ARRAY[@]}
do
	echo $ele
done

# read password - time limit (sec) and not visible
read -p "Enter password > " -t 5 -s PASS 
echo "Password: $PASS"

# read with default input - this fill input with default value
# we can edit that value inorder to provide something else
read -e -p "Enter Username: "  -i $USER ME
echo "Username: $ME"

# $ bash test.sh 
# Enter String > first
# Single String Input -> first
# Enter Array > a b c
# a
# b
# c
# Enter password > Password: random
# Enter Username: himanshu
# Username: himanshu
