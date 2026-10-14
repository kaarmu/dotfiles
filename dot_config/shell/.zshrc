PS1='%F{blue}%B%~%b%f %F{green}❯%f '

autoload -U compinit && compinit

bindkey -e
bindkey "\e[A" history-beginning-search-backward
bindkey "\e[B" history-beginning-search-forward

alias v='nvim'
alias o='xdg-open'
alias g='git'

# color
alias ls='ls --color=auto -hv'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -c=auto'

alias l='ls'
alias ll='ls -l'
alias la='ls -lA'

alias mv='mv -i'

precmd () { print -Pn "\e]2;%-3~\a"; }

eval "$(/Users/kaarmu/.local/bin/mise activate zsh)"
PATH="$PATH:$HOME/.local/share/bin"

