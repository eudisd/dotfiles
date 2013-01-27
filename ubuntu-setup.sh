sudo apt-get install curl \
                     git-core \ 
                     build-essential \ 
                     wget \
                     subversion \ 
                     python-pip \
                     openssh-client \
                     openssh-server \

sudo pip install virtualenv

cd ~; mkdir -p repos/git/github; cd repos/git/github


# Github pull dotfiles and install

git clone git@github.com:eudis/dotfiles


# oh my zsh install
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# Pathongen install
