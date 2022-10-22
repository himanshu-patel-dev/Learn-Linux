#!/bin/bash

invalid_input () {
	echo "Invalid input '$REPLY'" >&2
	exit 1
}
read -p "Enter a single item > "

# input is empty
[[ -z $REPLY ]] && invalid_input

# input is multiple items
(( $(echo $REPLY | wc -w) > 1 )) && invalid_input

# input is a valida filename
# -[:alnum:]\._ means 
# - is used before alnum so we don't end up specifing a range using -
# \. means the . is valid in filename (using escape char to represent)
# _ is valid in filename
if [[ $REPLY =~ ^[-[:alnum:]\._]+$ ]]; then
	echo "'$REPLY' is a valid filename."
	if [[ -e $REPLY ]]; then
		echo "And file '$REPLY' exists."
	else
		echo "However, file '$REPLY' does not exist."
	fi

	# is input a floating point number?
	if [[ $REPLY =~ ^-?[[:digit:]]*\.[[:digit:]]+$ ]]; then
		echo "'$REPLY' is a floating point number."
	else
		echo "'$REPLY' is not a floating point number."
	fi

	# is input an integer?
	if [[ $REPLY =~ ^-?[[:digit:]]$ ]]; then
		echo "'$REPLY' is an integer."
	else
		echo "'$REPLY' is not an integer."
	fi
else
	echo "The string '$REPLY' is not a valid filename."
fi