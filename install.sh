#!/usr/bin/env sh
set -eu

HERE=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# nvim
ln --force --symbolic "${HERE}/nvim/init.vim" "${HOME}/.config/nvim/init.vim"

stow --target="${HOME}" i3 vim zathura zsh git
