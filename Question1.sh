#!/bin/bash

# This script finds all "lucky" numbers between 1,000 and 10,000, inclusive.
# A lucky number is defined as a number whose digits recursively sum to 7.

# Recursive function that determines if the supplied number is a lucky number
function getLucky {
	num="$1"	# Re-name the input parameter to something more descriptive
	sum=0
	while [ $num -gt 0 ] ; do
		sum=$(( $sum+($num%10) ))	# Add the trailing digit to the sum
		num=$(( $num/10 ))		# Divide num by 10 to eliminate the digit just summed
	done
	if [ $sum -eq 7 ] ; then	# Return "1" if the digits sum to 7
		echo "1"
	elif [ $sum -lt 10 ] ; then	# Return "0" if the digits do not sum to 7 and
		echo "0"		# another iteration is not possible
	else
		getLucky $sum		# Otherwise, call the function again
	fi
}

# Determine which numbers between 1000 and 10000 are lucky
for (( n=1000; n<=10000; n++ )) ; do
	if [ $(getLucky $n) -eq 1 ] ; then
		echo "$n"		# If the number is lucky, print it
	fi
done
