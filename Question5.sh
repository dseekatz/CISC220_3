#!/bin/bash
# David Seekatz		16das4 20037710
# Sean Eylott	    	13se18 10141657
# Simon Ungar         	14seau 10149546
# Brooke Resendes     	13brr2 10141112

#This script looks for all executable files in the current directory and adds "#Developed in cisc220" just after the #!/bin/bash line
#find command finds the executable files, and awk is supposed to search for bin/bash and place the sentence underneath it
find . -type f -executable | sed 's@#!/bin/bash@#!/bin/bash\n"#Developed in cisc220"@' *.sh


