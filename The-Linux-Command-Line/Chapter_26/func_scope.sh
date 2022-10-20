#!/bin/bash
# local-vars: script to demonstrate local variables

# global variable foo
foo=0

funct_1 () {
	local foo
	foo=1
	echo "funct_1: foo = $foo"
}

funct_2 () {
	local foo
	foo=2
	echo "funct_2: foo = $foo"
}

echo "global: foo = $foo"
funct_1
echo "global: foo = $foo"
funct_2
echo "global: foo = $foo"

# global: foo = 0
# funct_1: foo = 1
# global: foo = 0
# funct_2: foo = 2
# global: foo = 0