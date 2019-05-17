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

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
# PROMPT=\$vcs_info_msg_0_'%# '
zstyle ':vcs_info:git:*' formats '%b'

[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"
