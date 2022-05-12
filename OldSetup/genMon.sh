#!/bin/sh
echo $(( $(wmctrl -d | grep \* | tr -s " " | cut -d' ' -f1 ) + 1 ))
