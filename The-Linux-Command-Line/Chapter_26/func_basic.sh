#!/bin/bash

# Shell function

function func1 {
	echo "Step 2"
	return
}

echo "Step 1"
func1
echo "Step 3"

# Step 1
# Step 2
# Step 3