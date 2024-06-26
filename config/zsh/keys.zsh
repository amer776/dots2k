# Key Bindings
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
autoload -Uz copy-earlier-word
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zle -N copy-earlier-word

bindkey -s '^H' ' reload^M ^M'
bindkey -s '^T' ' tea^M ^M'
bindkey -s "^G" ' lazygit^M ^M'
bindkey '^K' autosuggest-accept
bindkey "^F" fzf-file-widget
bindkey "^X^E" edit-command-line
bindkey "^[." insert-last-word
bindkey "^[m" copy-earlier-word

