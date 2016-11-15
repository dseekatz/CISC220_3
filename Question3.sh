#!/bin/bash
# David Seekatz		16das4 20037710
# Sean Eylott	    	13se18 10141657
# Simon Ungar         	14seau 10149546
# Brooke Resendes     	13brr2 10141112

# This script checks and validates passwords. It takes the password as hidden input and checks the following conditions:
#[1] Minimum length of 8 characters.
#[2] Must contain at least one numeric character.
#[3] Must contain at least one of the following non-alphabetic characters: @, #, $, %, &, *, +, -, =. The script outputs “Weak” if only one condition is satisfied, “Moderate” if only two conditions are satisfied, and “Strong” if all are satisfied.

read -p "Enter your password, hit return to end: " -s PASSWORD #gets the password from the user
strength=0
specials=("&" "#" "@" "$" "*" "+" "=" "-" "%") #initiate an array of characters to be used later
if ((${#PASSWORD} > 7)) ; then #checks password length
	((strength = strength + 1)); #increment strength to keep track of how many conditions are satisfied
fi

numNums=$(echo $PASSWORD | grep -o -E '[0-9]+') #checks to see if there are any numbers in our password
if ((${#numNums} > 0)); then
	((strength = strength + 1));
fi

for special in "${specials[@]}"; do #iterate through our array of special chars
	numSpecial=$(echo $PASSWORD | grep -o -E "$special") #see if the special char is found in our password
	if ((${#numSpecial} > 0)); then
		((strength = strength + 1))
		break
	fi
done

#now that strength is some number from 0-3, echo the password strength to the user.
echo
if (( $strength < 1 )) ; then
	echo Your password does not satisfy any requirements.
elif (( $strength < 2 )) ; then
	echo Your password is weak.;
elif (( $strength < 3 )) ; then
	echo Your password is of medium strength.;
else
	echo Your password is strong!
fi


