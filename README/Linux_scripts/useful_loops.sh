#!/bin/bash

# Printing the permissions of /etc/shadow and /etc/passwd
#/etc/shadow
#/etc/passwd

# Variable for listing files
perm=$(sudo ls /etc/{shadow,passwd})

# loop for printing each file with permissions
for permis in ${perm[@]};
 do 
    ls -l $permis
done

#Bonus one
#loop that checks sudo abilities of each user that has a home folder

#Variable for listing users
user=$(ls /home)

#loop to check each user for sudo abilities
for usr in ${user[@]};
 do
    groups $usr
done
