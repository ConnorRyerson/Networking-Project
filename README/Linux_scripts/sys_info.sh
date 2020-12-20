#!/bin/bash

# Check if script was run as root. Exit if true.
if [ $UID -eq 0 ]; then
   echo "Please do not run this script as root!"
   exit
fi


# Variable for output path.
output=$HOME/research/sys_info.txt

# Checks for existence of ~/research directory.

if [ -d $HOME/research ]
 then
   echo "The directory exists"
 else
   mkdir $HOME/research 2> /dev/null
fi

# Checks for 

#if [ -f $output ]
# then
#   rm $output
#fi

mkdir ~/research 2> /dev/null
now="$(date)"
printf "Current date and time %s\n" "$now" > ~/research/sys_info.txt
uname >> ~/research/sys_info.txt; hostname -I >> $output; hostname >> $output
echo ' ' >> $output

echo '~DNS Info~' >> $output
grep nameserver /etc/resolv.conf >> $output
echo ' ' >> $output

echo '~Memory Info~' >> $output
cat /proc/meminfo >> $output
echo ' ' >> $output

echo '~CPU Info~' >> $output
cat /proc/cpuinfo >> $output
echo ' ' >> $output

echo '~Disk Usage~' >> $output
df -h >> $output
echo ' ' >> $output

w >> $output
echo ' ' >> $output

echo '~777 files~' >> $output
sudo find /home -type f -perm 777 >> $output
echo ' ' >> $output

echo '~Top 10 processes~' >> $output
ps aux -m | awk '{print $1, $2, $3, $4, $11}' | head >> $output
