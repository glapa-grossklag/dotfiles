#!/usr/bin/env bash
# ===
# install.sh
# ===

alias cp="cp --interactive --recursive --verbose"
alias rm="rm --interactive --recursive --verbose"
alias mv="mv --interactive --verbose"
alias ln="ln --interactive --verbose"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# ---
# Zsh
# ---

# Zsh
if test $(which zsh); then
    ln -s "${DIR}/zsh/.zshrc" "${HOME}/.zshrc"
else
    # We don't install automatically since Zsh should be
    # installed using the user's package manager of choice
    echo "Zsh is not installed, skipping .zshrc." 1>&2
fi


# ---
# Vim
# ---

# Vim
if test -d "${HOME}/.vim"; then
    rm "${HOME}/.vim"
fi
ln -s "${DIR}/vim" "${HOME}/.vim"

# Plugins
vim -c 'PlugInstall' -c 'qa!'

# ---
# i3
# ---

mkdir -p "${HOME}/.config/"
if test -d "${HOME}/.config/i3"; then
    rm "${HOME}/.config/i3"
fi
ln -s "${DIR}/i3" "${HOME}/.config/i3"

