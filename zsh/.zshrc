# Exports
export TERM=xterm-256color
export EDITOR="vim"
export ZSH="~/.oh-my-zsh"
export TODAY=$(date -I)

ZSH_THEME="theme"
source $ZSH/oh-my-zsh.sh

# Plugins
plugins=(
    history-substring-search
)

# Aliases
alias ll="ls -lhA"
alias xterm-f='xterm -b 20 -fa "DejaVu Sans Mono" -fs 12'
alias v="vim"
alias r="ranger"
alias sd="shutdown"
alias today="vim ~/notes/daily/$(date -I).md"

function hist() {
    history | grep "$1" | tail -n "${2:-10}"
}

# Plugins
source ~/.oh-my-zsh/plugins/history-substring-search/history-substring-search.zsh
