#!/bin/bash

sudo apt update
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#############################
## CLEAR EXISTING DOTFILES ##
#############################
# if .bashrc already there then copy it to dotfiles/backup
[ -f ~/.bashrc ] && cp -f ~/.bashrc ~/dotfiles/backups/.bashrc && rm -r ~/.bashrc
[ -f ~/.zshrc ] && rm -r ~/.zshrc
[ -d ~/.oh-my-zsh ] && rm -rf ~/.oh-my-zsh
[ -f ~/.tmux.conf ] && rm -r ~/.tmux.conf
[ -f ~/.vimrc ] && rm -r ~/.vimrc


######################
## ZSH INSTALLATION ##
######################

# install ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#######################
## SYM-LINK DOTFILES ##
#######################

# backup any existing dotfiles
mkdir ~/dotfiles/backups

# bash
ln -s ${BASEDIR}/.bashrc ~/.bashrc

# zsh
ln -s ${BASEDIR}/.zshrc ~/.zshrc

# oh my zsh
ln -s  ${BASEDIR}/.oh-my-zsh ~/.oh-my-zsh

# git
# if .gitconfig already there then leave it alone
! [ -f ~/.gitconfig ] && ln -s ${BASEDIR}/.gitconfig ~/.gitconfig

# tmux
ln -s ${BASEDIR}/.tmux.conf ~/.tmux.conf

# vim
ln -s ${BASEDIR}/.vimrc ~/.vimrc

#######################
## OH-MY-ZSH PLUGINS ##
#######################

sudo apt install git-core curl fonts-powerline
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
! [ -d $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] && \
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting


# this will answer yes to any installation questions
# https://linux.die.net/man/1/yes
echo "bootstrap complete!"<<-EOF
yes
EOF