#!/bin/bash

read -p "Enter your password, hit return to end: " -s PASSWORD
echo $PASSWORD
strength=0
specials=("&" "#" "@" "$" "*" "+" "=" "-" "%")
if ((${#PASSWORD} > 7)) ; then
 strength++;
fi

for (( n=0 ; n <=${#PASSWORD} ; n++ )); do
	for m in {0..9}; do
		if [[${PASSWORD:n:1} == m]]; then
			strength++
			break;
		fi;
	done;
done

for (( n=0 ; n <=${#PASSWORD} ; n++ )); do
        for char in specials; do
                if [[${PASSWORD:n:1} == char]]; then
                        strength++
                        break;
                fi;
        done;
done

