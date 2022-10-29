#!/bin/bash

set -x # Turn on tracing
number=1
if [ $number = 1 ]; then
	echo "Number is equal to 1."
else
	echo "Number is not equal to 1."
fi
set +x # Turn off tracing
