#!/bin/sh

# apply all files from dotfiles to its correspondent folders in your home directory

# catch all files in repo
files=$(find . -mindepth 1 -type f | grep -v '.git\/\|.md\|pull.sh\|apply.sh')

# diff all of them with correspondent local file on machine
for file in $files
do 
	relative=${file#"./"}
	dotfile="$(pwd)/$relative"
	userfile="$HOME/$relative"
	echo "Applying diff $dotfile -> $userfile..."
	
	if diff --color=auto -N "$userfile" "$dotfile"; then
		echo "File is up to date."
	else
		printf "Files have been changed. Do you want to apply ($dotfile -> $userfile)? (y/N) "
		read -r answer
		if [ ! "$answer" = "${answer#[Yy]}" ] ;then
			echo Copying file...
			cp "$dotfile" "$userfile" && echo Done. || echo Failed.
		else
			echo Skipping.
		fi
	fi
done
