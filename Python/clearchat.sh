#!/bin/bash

while true; do
        read -p "Do you wish to clear the Send and Results folder in chatarrilla? " yn
            case $yn in
                [Yy]* ) ssh ignacio@chatarrilla.chiton -p 13 'rm -r Projects/Send/* ; rm Projects/Results/*;'; exit;;
                [Nn]* ) exit;;
                * ) echo "(yes/no)";;
            esac
done
