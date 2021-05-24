# ===
# .zshrc
# ===

# Set left prompt to print working directory
PROMPT='%1~ $ '

# Set right prompt to print most recent exit code if non-zero
RPROMPT='%B%(?..%?)%b'

# Programs
TERM='st'
TERMINAL='st'
EDITOR='nvim'
VISUAL='nvim'
READER='zathura --fork'

# Save history
HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
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

function condapls {
    eval "$(/home/miles/anaconda3/bin/conda shell.zsh hook)"
}

# General usability
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lhA'
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v --preserve-root'
alias e='${EDITOR}'
alias ef='${EDITOR} $(fzf)'
alias r='ranger'
alias rf='ranger $(find -type d | fzf)'
alias cdf='cd "$(find -type d | fzf)"'
alias please='sudo $(fc -ln -1)'

# System-specific
alias zathura='zathura --fork'
alias streamaudio="mpv --volume=25 --no-video --ytdl-format='bestaudio/best'"
alias streamvideo="mpv --volume=25 --ytdl-format='best'"
alias today="${EDITOR} ~/notes/daily/$(date -I).md"

# Suffix aliases
alias -s pdf="${READER}"

# z - https://github.com/rupa/z
. /usr/local/bin/z.sh
