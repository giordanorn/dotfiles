# .dotfiles

This repo stores a lot of configuration files and helpful scripts I use on my computers.

Some day i'm gonna write a good documentation for it.

# Installation
You may clone this repo by running the following command on any terminal emulator:
```sh
git clone https://github.com/giordanorn/.dotfiles
```

Once you clonded it, you might run the `apply.sh` util script if you want to apply the configuration files onto your computer.

*NOTE: You should run this script at the top directory of this repository, so make sure you are in the right directory, by default it is `.dotfiles/`.*

After you clone it, you might run:
```sh
cd .dotfiles/
./apply.sh
```

Also, there is an utility script called `pull.sh` which does the reverse way of `apply.sh`. It might be useful just for me while doing the update of this repo. But it may be useful for anyone who wants to keep your dotfiles updated easily, so feel free to take this piece of code for you. Beware, it shoud satisfy the same restriction aswell.

That's it.
