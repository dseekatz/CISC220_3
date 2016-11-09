#!/bin/bash

#This script looks for all executable files in the current directory and adds "#Developed in cisc220" just after the #!/bin/bash line

#find command finds the executable files, and awk is supposed to search for bin/bash and place the sentence underneath it
#not working atm
find .-type f -executable $ awk '/#!/bin/bash/{print;print "#Developed in cisc220";next}1' 
