#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# bash
ln -s ${BASEDIR}/.bashrc ~/.bashrc

# zsh
ln -s ${BASEDIR}/.zshrc ~/.zshrc
