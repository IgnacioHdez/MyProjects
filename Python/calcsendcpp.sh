#!/bin/bash

sh /home/ignacio/Projects/clearchat.sh

#First I send the program stored in /Send to chatarrila
echo "Sending content of ~/Projects/Send"
scp -r -P13 /home/ignacio/Projects/Send/* ignacio@chatarrilla.chiton:~/Projects/Send/

echo "Starting compilation"
# echo 'cd ~/Projects/Send && py '$1' >& ../Results/stderr &'
ssh ignacio@chatarrilla.chiton -p 13 'cd Projects/Send && g++ -o Compiled '$1' >& ../Results/stderrcomp'
ssh ignacio@chatarrilla.chiton -p 13 'cd Projects/Send && ./Compiled >& ../Results/stderr &'

echo "Launching Program"
