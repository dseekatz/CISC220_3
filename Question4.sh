#!/bin/bash

#Write a single line command using pipes to sort the output of the lsblk-noheadings -raw command by partition size 
#head command displays only the two partitions with the largest sizes 
lsblk --noheadings --raw | grep -e part | sed s/"G"/" G"/ | sed s/"M"/" M"/ | sort -k4n | head -n2
