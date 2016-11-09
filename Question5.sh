#!/bin/bash

#This script looks for all executable files in the current directory and adds "#Developed in cisc220" just after the #!/bin/bash line

find .-type f -executable $ awk '#!/bin/bash' echo '#Developed in cisc220' 
