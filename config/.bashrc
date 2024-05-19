#!/bin/bash
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'

if [[ ${EUID} == 0 ]]; then
    PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
else
    PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
fi

complete -cf sudo
shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend

alias reload="source ~/.bashrc"

# bash completions
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# fzf keybindings
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source ~/.config/shell/environment.sh
source ~/.config/shell/functions.sh
source ~/.config/shell/aliases.sh

# Tool confs for bash
if type navi >/dev/null 2>&1; then eval "$(navi widget bash)"; fi
if type zoxide >/dev/null 2>&1; then eval "$(zoxide init bash)"; fi
if type mise >/dev/null 2>&1; then
    eval "$(mise activate bash)"
    eval "$(mise completion bash)"
fi

# Local configurations
[ -f ~/.config/shell/local.sh ] && source ~/.config/shell/local.sh
