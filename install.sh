#!/usr/bin/env sh
# ===
# install.sh
# ===

alias cp=cp --update --interactive --recursive --verbose
alias mv=mv --update --interactive --verbose
alias rm=rm --interactive --recursive --verbose

# ---
# Zsh
# ---

echo "Setting up Zsh..."

# Zsh
if test ! $(which zsh); then
    # We don't install automatically since Zsh should be
    # installed using the user's package manager of choice
    echo "Cannot find Zsh" 1>&2
fi

# Oh-My-Zsh
if ! test -d "$HOME/.oh-my-zsh"; then
    echo "Installing Oh-My-Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Out with the old, in with the new
cp ./zsh/.zshrc ~/.zshrc
cp ./zsh/theme.zsh-theme ~/.oh-my-zsh/custom/themes/theme.zsh-theme

# ---
# Vim
# ---

echo "Setting up Vim..."

# Out with the old, in with the new
mkdir -p ~/.vim/
mkdir ~/.vim/undodir
if test -e ~/.vimrc; then
    # Use ~/vim to store vim files
    mv ~/.vimrc ~/.vim/vimrc
fi
cp ./vim ~/.vim

# Plugins
echo "Installing plugins..."
vim -c 'PlugInstall' -c 'qa!'

# ---
# i3
# ---

echo "Setting up i3..."

# Out with the old, in with the new
mkdir -p ~/.config/i3/
cp -T ./i3 ~/.config/i3/
