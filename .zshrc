#!/bin/zsh

autoload -Uz compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
prompt suse

# Enables auto completion
zstyle ':completion:*' menu select

# Auto copmlete custom aliases
setopt COMPLETE_ALIASES

# Auto complete sudo commands
zstyle ':completion::complete:*' gain-privileges 1

# bind emacs-like shorcuts
bindkey -e

export EDITOR="vim"
export BROWSER="firefox"
export READER="evince"
export TERMINAL="st"

[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"
