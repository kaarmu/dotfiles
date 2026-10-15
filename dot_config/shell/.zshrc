PS1='%F{blue}%B%~%b%f %F{green}❯%f '

autoload -U compinit && compinit

# Save history on Linux too; these match macOS's /etc/zshrc defaults.
HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
HISTSIZE=2000
SAVEHIST=1000

bindkey -e
# Arrows send \e[A or \eOA depending on the terminal's keypad mode.
for up down in "\e[A" "\e[B" "\eOA" "\eOB"; do
    bindkey "$up" history-beginning-search-backward
    bindkey "$down" history-beginning-search-forward
done

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

# Prefer eza once mise provides it; the system ls aliases above are the fallback.
if command -v eza >/dev/null 2>&1; then
    alias ls='eza'
    alias tree='eza --tree'
fi

# Use the same bat config location on macOS and Linux.
export BAT_CONFIG_PATH="$HOME/.config/bat/config"
