#!/bin/bash

# Variable for 5 of my favorite states.
states=(
	'Idaho'
	'Colorado'
	'Hawaii'
	'Oregon'
	'Nevada'
)

# Check for Hawaii

for state in ${states[@]};
 do
    if [ $state = 'Hawaii' ]
   then
	echo "Hawaii is the best!"
    fi
done

# Variable for 0-9
numbers=( 0 1 2 3 4 5 6 7 8 9)

# Variable for ls
list=$(ls)

# loop that prints out only the numbers 3, 5 and 7
for number in ${numbers[@]};
 do
    if [ $number = 3 ] || [ $number = 5 ] || [ $number = 7 ];
   then
	echo $number
    fi
done

# loop that prints out each item of this variable.
for file in ${list[@]};
 do
    echo $file
 done

# Variable for find /home -type f -perm 777 2> /dev/null
files=$(find / -type f -perm 777 2> /dev/null)

# loop for 777 perm files
for perm in ${files[@]};
 do
    ls -l $perm
 done
