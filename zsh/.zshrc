# ===
# .zshrc
# ===

# Set left prompt to print working directory
export PROMPT='%1~ $ '

# Set right prompt to print most recent exit code if non-zero
export RPROMPT='%B%(?..%?)%b'

# Use the suckless simple terminal
export TERM='st'

# Use Vim
export EDITOR='vim'

# Save history
export HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"

# Type only <directory> instead of cd <directory>
setopt AUTO_CD 

# Share history across sessions
setopt SHARE_HISTORY 

# Add commands to history as they are typed
setopt INC_APPEND_HISTORY

# Enable nice tab completion
autoload -Uz compinit && compinit

# Search through history
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search

# ---
# Functions, Aliases
# ---

# First mkdir, then cd.
function mkcd {
    mkdir "$1"
    cd "$1"
}

# Use grep to search through history.
function hgrep {
    history | grep "$1" | tail -n "${2:-10}"
}

alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lhA'
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v --preserve-root'
