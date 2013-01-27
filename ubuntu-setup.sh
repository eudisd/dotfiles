#! /usr/bin/env bash

sudo apt-get install curl \
                     git-core \ 
                     build-essential \ 
                     wget \
                     subversion \ 
                     python-pip \
                     openssh-client \
                     openssh-server \

sudo pip install virtualenv


# Create repos directory
cd ~; mkdir -p repos/git/github; cd repos/git/github

# Github pull dotfiles and install
git clone git@github.com:eudis/dotfiles

# Copy dotfiles to home folder and change back to $HOME
cd dotfiles; cp -r .* ~; cp -r * ~; cd ~

# oh-my-zsh install
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# Pathongen install
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -Sso ~/.vim/autoload/pathogen.vim \
https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim


