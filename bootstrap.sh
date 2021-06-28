#!/bin/bash

sudo apt update
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo $BASEDIR
echo $HOME

#############################
## CLEAR EXISTING DOTFILES ##
#############################
# if .bashrc already there then copy it to dotfiles/backup
! [ -d $HOME/dotfiles/backups ] && mkdir $HOME/dotfiles/backups
[ -f $HOME/.bashrc ] && cp -f $HOME/.bashrc $HOME/dotfiles/backups/.bashrc && rm -r $HOME/.bashrc

[ -f $HOME/.zshrc ] && rm -r $HOME/.zshrc
[ -d $HOME/.oh-my-zsh ] && rm -rf $HOME/.oh-my-zsh
[ -f $HOME/.tmux.conf ] && rm -r $HOME/.tmux.conf
[ -f $HOME/.vimrc ] && rm -r $HOME/.vimrc


######################
## ZSH INSTALLATION ##
######################

# install ZSH
echo "Installing ZSH"
sudo apt install zsh

# make zsh your default shell
chsh -s $(which zsh)

#######################
## SYM-LINK DOTFILES ##
#######################

# bash
echo "Symlink: .bashrc"
ln -s ${BASEDIR}/.bashrc $HOME/.bashrc

# zsh
echo "Symlink: .zshrc"
ln -s ${BASEDIR}/.zshrc $HOME/.zshrc

# oh my zsh
echo "Symlink: .oh-my-zsh"
ln -s  ${BASEDIR}/.oh-my-zsh $HOME/.oh-my-zsh

# git
# if .gitconfig already there then leave it alone
echo "Symlink: .gitconfig"
! [ -f $HOME/.gitconfig ] && ln -s ${BASEDIR}/.gitconfig $HOME/.gitconfig

# tmux
echo "Symlink: .tmux.conf"
ln -s ${BASEDIR}/.tmux.conf $HOME/.tmux.conf

# vim
echo "Symlink: .vimrc"
ln -s ${BASEDIR}/.vimrc $HOME/.vimrc

#######################
## OH-MY-ZSH PLUGINS ##
#######################

[ -d $HOME/.oh-my-zsh ] && rm -rf $HOME/.oh-my-zsh && echo "Removed existing ~/.oh-my-zsh dir"
sudo apt install git-core curl fonts-powerline
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
! [ -d $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] && \
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
! [ -d $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] && cp -r ${BASEDIR}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting $HOME/.oh-my-zsh/custom/plugins


# this will answer yes to any installation questions
# https://linux.die.net/man/1/yes
echo "bootstrap complete!"<<-EOF
yes
EOF