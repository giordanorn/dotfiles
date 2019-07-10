#!/bin/sh

# apply all files from dotfiles to its correspondent folders in your home directory

# catch all files in repo
files=`find -mindepth 1 $SCRITPS -type f | grep -v '.git\/\|.md\|pull.sh\|apply.sh'`

# diff all of them with correspondent local file on machine
for file in $files
do 
	relative=${file#"./"}
	dotfile=$(pwd)/$relative
	userfile=$HOME/$relative
	echo "Applying diff $dotfile -> $userfile..."
	diff --color=auto -N $userfile $dotfile
	if [ $? -eq 0 ]; then
		echo "File is up to date."
	else
		echo -n "Files have been changed. Do you want to apply (dotfiles -> $USER)? (y/N) "
		read answer
		if [ "$answer" != "${answer#[Yy]}" ] ;then
			echo Copying file...
			cp $dotfile $userfile
			echo Done.
		else
			echo Skipping.
		fi
	fi
done
