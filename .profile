
#!/bin/bash

export EDITOR="vim"
export BROWSER="firefox"
export READER="zathura"
export TERMINAL="st"

if [ "$(tty)" = "/dev/tty1" ]; then
	pgrep -x i3 || exec startx
fi
