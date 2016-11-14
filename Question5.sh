#!/bin/bash

#This script looks for all executable files in the current directory and adds "#Developed in cisc220" just after the #!/bin/bash line
#find command finds the executable files, and awk is supposed to search for bin/bash and place the sentence underneath it
find . -type f -executable | sed 's@#!/bin/bash@#!/bin/bash\n"#Developed in cisc220"@' *.sh


