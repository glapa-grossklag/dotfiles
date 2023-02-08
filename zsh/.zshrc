# ======
# .zshrc
# ======

# z - https://github.com/rupa/z
source /usr/local/bin/z.sh

# Set left prompt to print working directory
export PROMPT='%1~ $ '

# Set right prompt to print most recent exit code if non-zero
export RPROMPT='%B%(?..%?)%b'


export PATH="$HOME/Code/scripts:$HOME/.local/bin:$PATH"
export EDITOR='nvim'
export VISUAL='nvim'

# Save history
export HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
setopt APPENDHISTORY
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

# Type only <directory> instead of cd <directory>
setopt AUTO_CD

# Enable nice tab completion
autoload -Uz compinit && compinit

# Search through history
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search

# ------------------
# Functions, Aliases
# ------------------

# First mkdir, then cd.
function mkcd {
    mkdir "$1"
    cd "$1"
}

# Open an editor and save it to the clipboard.
function eclip {
    FILE=$(mktemp)
    $EDITOR "${FILE}"
    xclip -selection c < "${FILE}"
    \rm "${FILE}"
}

# General usability
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lhA'
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v --preserve-root'
alias e='${EDITOR}'
alias please='sudo $(fc -ln -1)'
