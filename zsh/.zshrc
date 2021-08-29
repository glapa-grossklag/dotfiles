# ===
# .zshrc
# ===

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# z - https://github.com/rupa/z
source /usr/local/bin/z.sh

# Set left prompt to print working directory
export PROMPT='%1~ $ '

# Set right prompt to print most recent exit code if non-zero
export RPROMPT='%B%(?..%?)%b'

# Path
export PATH="$HOME/docs/code/scripts:$PATH"

# Programs
export TERM='st'
export TERMINAL='st'
export EDITOR='nvim'
export VISUAL='nvim'
export READER='zathura --fork'
export GPG_TTY=$(tty)

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

# Grab a PDF, give it to zathura.
function zathcurl {
    curl "$1" --output - | zathura --fork -
}

# Open an editor and save it to the clipboard.
function eclip {
    FILE=$(mktemp)
    $EDITOR "${FILE}"
    xclip -selection c < "${FILE}"
    \rm "${FILE}"
}

# Countdown lasting $1 seconds
function countdown {
    date1=$((`date +%s` + $1));
    while [ "$date1" -ge `date +%s` ]; do
        echo -ne "\r$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)";
        sleep 0.1
    done
}

function stopwatch {
    date1=`date +%s`;
    while true; do
        echo -ne "\r$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)";
        sleep 0.1
    done
}

# General usability
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lhA'
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v --preserve-root'
alias e='${EDITOR}'
alias r='ranger'
alias please='sudo $(fc -ln -1)'

# System-specific
alias zathura='zathura --fork'
alias streamaudio="mpv --volume=25 --no-video --ytdl-format='bestaudio/best'"
alias streamvideo="mpv --volume=25 --ytdl-format='best'"

# Suffix aliases
alias -s pdf="${READER}"
