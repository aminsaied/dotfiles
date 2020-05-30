#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# bash
ln -s ${BASEDIR}/.bashrc ~/.bashrc

# zsh
ln -s ${BASEDIR}/.zshrc ~/.zshrc

# oh my zsh
ln -s  ${BASEDIR}/.oh-my-zsh ~/.oh-my-zsh

# git
ln -s ${BASEDIR}/.gitconfig ~/.gitconfig

# tmux
ln -s ${BASEDIR}/.tmux.conf ~/.tmux.conf
