#!/bin/bash

#This script looks for all executable files in the current directory and adds "#Developed in cisc220" just after the #!/bin/bash line

#Checking for executable files
find <dir> -executable  #or should we be using execvp to run a find command (p 29)

#should this be in an if statement?
