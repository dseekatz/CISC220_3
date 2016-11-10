#!/bin/bash

#Write a single line command using pipes to sort the output of the lsblk-noheadings -raw command by partition size 
#Then display only the two partitions with the largest sizes 
#$df -H lists partition size but not ascendingly by size

lsblk -- noheadings -raw | $ sudo sfdisk -1 -uM