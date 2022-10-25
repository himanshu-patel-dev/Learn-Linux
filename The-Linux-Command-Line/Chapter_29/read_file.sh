#!/bin/bash

while read distro version release; do
	printf "Distro: %s\tVersion: %s\tReleased: %s\n" \
	$distro \
	$version \
	$release
done < distro.txt

# Distro: SUSE    Version: 10.2   Released: 12/07/2006
# Distro: Fedora  Version: 10     Released: 11/25/2008
# Distro: SUSE    Version: 11.0   Released: 06/18/2008
# Distro: Ubuntu  Version: 8.04   Released: 04/24/2008