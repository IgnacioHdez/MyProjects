#!/bin/bash

#First I send the program stored in /Send to chatarrila
echo "Sending content of ~/Projects/Send"
scp -r -P13 /home/ignacio/Projects/Send/* ignacio@chatarrilla.chiton:~/Projects/Send/

echo "Starting calculation"
ssh ignacio@chatarrilla.chiton -p 13 'python3 -u Projects/Send/'$1' >& /home/ignacio/Projects/Results/stderr &'
