#!/usr/bin/env bash
set -eu

HERE=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# nvim
ln --force --symbolic "${HERE}/nvim/init.vim" "${HOME}/.config/nvim/init.vim"

# zsh
ln --force --symbolic "${HERE}/zsh/.zshrc" "${HOME}/.zshrc"

# git
ln --force --symbolic "${HERE}/git/.gitconfig" "${HOME}/.gitconfig"

stow --target="${HOME}" i3 vim zathura
