#!/bin/bash

read -p "Enter your password, hit return to end: " -s PASSWORD
strength=0
specials=("&" "#" "@" "$" "*" "+" "=" "-" "%")
if ((${#PASSWORD} > 7)) ; then
	((strength = strength + 1));
fi

numNums=$(echo $PASSWORD | grep -o -E '[0-9]+')
if ((${#numNums} > 0)); then
	((strength = strength + 1));
fi

for special in "${specials[@]}"; do
	numSpecial=$(echo $PASSWORD | grep -o -E "$special")
	if ((${#numSpecial} > 0)); then
		((strength = strength + 1))
		break
	fi
done

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


