#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

######################
## ZSH INSTALLATION ##
######################

# install ZSH
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh
rm -r install.sh

#######################
## SYM-LINK DOTFILES ##
#######################

# backup any existing dotfiles
mkdir ~/dotfiles/backups

# bash
# is .bashrc already there then copy it to dotfiles/backup
[ -f ~/.bashrc ] && cp -f ~/.bashrc ~/dotfiles/backups/.bashrc && rm -r ~/.bashrc
ln -s ${BASEDIR}/.bashrc ~/.bashrc

# zsh
[ -f ~/.zshrc ] && cp -f ~/.zshrc ~/dotfiles/backups/.zshrc && rm -r ~/.zshrc
ln -s ${BASEDIR}/.zshrc ~/.zshrc

# oh my zsh
[ -f ~/.oh-my-zsh ] && cp -f ~/.oh-my-zsh ~/dotfiles/backups/.oh-my-zsh && rm -r ~/.oh-my-zsh
ln -s  ${BASEDIR}/.oh-my-zsh ~/.oh-my-zsh
# install oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# git
# if .gitconfig already there then leave it alone
! [ -f ~/.gitconfig ] && ln -s ${BASEDIR}/.gitconfig ~/.gitconfig

# tmux
[ -f ~/.tmux.conf ] && cp -f ~/.tmux.conf ~/dotfiles/backups/.tmux.conf && rm -r ~/.tmux.conf
ln -s ${BASEDIR}/.tmux.conf ~/.tmux.conf

# vim
# is .vimrc already there then copy it to dotfiles/backup
[ -f ~/.vimrc ] && cp -f ~/.vimrc ~/dotfiles/backups/.vimrc && rm -r ~/.vimrc
ln -s ${BASEDIR}/.vimrc ~/.vimrc

# this will answer yes to any installation questions
# https://linux.die.net/man/1/yes
echo "bootstrap complete!"<<-EOF
yes
EOF