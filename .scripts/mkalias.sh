#!/bin/sh

# Outputs aliases for each of your scripts in current directory. You should write it on your aliases file. (e.g. ./mkaliases >> ~/.aliases)

# IT REALLY NEEDS IMPROVEMENTS. IT IS CURRENTLY WORKING ONLY IF YOU ARE IN SCRIPTS FOLDER AND ONLY WITH .sh FILES

find . -mindepth 1 -maxdepth 1 | \
       	sed "s/\.\///g" | \
	sed "s/\.sh//g" | \
	awk '{ print "alias " $1 "=$HOME/.scripts/"$1".sh" }'
