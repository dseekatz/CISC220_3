#!/bin/bash
# David Seekatz		16das4 20037710
# Sean Eylott	    	13se18 10141657
# Simon Ungar         	14seau 10149546
# Brooke Resendes     	13brr2 10141112

#Write a single line command using pipes to sort the output of the lsblk-noheadings -raw command by partition size 
#The head command displays only the two partitions with the largest sizes 
lsblk --noheadings --raw | grep -e part | sed s/"G"/" G"/ | sed s/"M"/" M"/ | sort -k4n | head -n2
