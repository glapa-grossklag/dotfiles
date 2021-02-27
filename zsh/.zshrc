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

# Git
alias g="git"
alias ga="git add"
alias gs="git status"
alias gsu="git status -uno"
alias gl="git log"
alias glo="git log --oneline"
alias gc="git commit"
alias gm="git merge"

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
source "$ZSH/oh-my-zsh.sh"

plugins=(
    history-substring-search
)

source ~/.oh-my-zsh/plugins/history-substring-search/history-substring-search.zsh
