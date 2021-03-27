# ===
# Zsh
# ===

# ---
# Exports
# ---

export TERM=xterm-256color
export EDITOR="vim"
export ZSH="${HOME}/.oh-my-zsh"
export TODAY=$(date -I)

# ---
# Aliases + Functions
# ---

# General
alias ll="ls -lhA"
alias v="vim"
alias sd="shutdown"
alias today="vim ~/notes/daily/$(date -I).md"

# Search through history
function hist() {
    history | grep "$1" | tail -n "${2:-10}"
}

# mkdir + cd
function mkcd() {
    mkdir "$1"
    cd "$1"
}

# ---
# Oh-My-Zsh
# ---

ZSH_THEME="theme"

plugins=(
    git
)

source "$ZSH/oh-my-zsh.sh"
