#! /usr/bin/env bash

mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -Sso ~/.vim/autoload/pathogen.vim \
https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# Update locate
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
