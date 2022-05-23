#!/bin/bash
while true; do
    read -p "Do you wish to do this: $1 $2 $3 $4" yn
    case $yn in
        [Yy]* ) "$@"; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
