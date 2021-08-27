#!/usr/bin/env bash

alias cp="cp --interactive --recursive --verbose"
alias rm="rm --interactive --recursive --verbose"
alias mv="mv --interactive --verbose"
alias ln="ln --interactive --verbose"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

mkdir -p "${HOME}/.config/"

# Zsh
ln -s "${DIR}/.zshrc" "${HOME}/.zshrc"

# Neovim
ln -s "${DIR}/nvim" "${HOME}/.config/nvim"
nvim -c 'PlugInstall' -c 'qa!'

# i3wm
ln -s "${DIR}/i3" "${HOME}/.config/i3"

# Zathura
ln -s "${DIR}/zathura" "${HOME}/.config/zathura"
