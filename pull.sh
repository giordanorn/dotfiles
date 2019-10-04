#!/bin/sh

# import local files from your computer to its correspondents dotfiles folder

# catch all files in repo
files=$(find . -mindepth 1 -type f | grep -v '.git\/\|.md\|pull.sh\|apply.sh')

# diff all of them with correspondent local file on machine
for file in $files
do 
	relative=${file#"./"}
	dotfile="$(pwd)/$relative"
	userfile="$HOME/$relative"
	echo "Applying diff $userfile -> $dotfile..."
	if diff --color=auto -N "$dotfile" "$userfile"; then
		echo "File is up to date."
	else
		printf "Files have been changed. Do you want to apply ($userfile -> $dotfile)? (y/N) "
		read -r answer
		if [ ! "$answer" = "${answer#[Yy]}" ] ;then
			echo Copying file...
			cp "$userfile" "$dotfile" && echo Done. || echo Failed.
		else
			echo Skipping.
		fi
	fi
done
