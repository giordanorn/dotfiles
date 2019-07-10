#!/bin/sh

# import local files from your computer to its correspondents dotfiles folder

# catch all files in repo
files=`find -mindepth 1 $SCRITPS -type f | grep -v '.git\/\|.md\|pull.sh\|apply.sh'`

# diff all of them with correspondent local file on machine
for file in $files
do 
	relative=${file#"./"}
	dotfile=$(pwd)/$relative
	userfile=$HOME/$relative
	echo "Applying diff $userfile -> $dotfile..."
	diff --color=auto -N $dotfile $userfile
	if [ $? -eq 0 ]; then
		echo "File is up to date."
	else
		echo -n "Files have been changed. Do you want to apply ($USER -> dotfiles)? (y/N) "
		read answer
		if [ "$answer" != "${answer#[Yy]}" ] ;then
			echo Copying file...
			cp $userfile $dotfile
			echo Done.
		else
			echo Skipping.
		fi
	fi
done
