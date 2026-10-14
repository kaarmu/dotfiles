PS1='%F{blue}%B%~%b%f %F{green}❯%f '

autoload -U compinit && compinit

bindkey -e
bindkey "\e[A" history-beginning-search-backward
bindkey "\e[B" history-beginning-search-forward

alias v='nvim'
alias g='git'

case "$OSTYPE" in
    darwin*)
        alias o='open'
        alias ls='ls -Gh'
        ;;
    linux*)
        alias o='xdg-open'
        alias ls='ls --color=auto -hv'
        alias grep='grep --color=auto'
        alias diff='diff --color=auto'
        alias ip='ip -c=auto'
        ;;
esac

alias l='ls'
alias ll='ls -l'
alias la='ls -lA'
alias mv='mv -i'

precmd () { print -Pn "\e]2;%-3~\a"; }

# Make user-installed mise discoverable on both macOS and Linux.
typeset -U path
path=("$HOME/.local/bin" "$HOME/.local/share/bin" $path)
if command -v mise >/dev/null 2>&1; then
    eval "$(mise activate zsh)"
fi
