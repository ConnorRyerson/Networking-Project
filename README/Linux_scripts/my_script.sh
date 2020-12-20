#!/bin/bash

mkdir ~/research
sudo find /home -type f -perm 777 >> ~/research/sys_info.txt
ps aux -m | awk '{print $1, $2, $3, $4, $11}' | head >> ~/research/sys_info.txt
