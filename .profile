
#!/bin/bash

export EDITOR="vim"
export BROWSER="qutebrowser"
export READER="zathura"

if [ "$(tty)" = "/dev/tty1" ]; then
	pgrep -x i3 || exec startx
fi
