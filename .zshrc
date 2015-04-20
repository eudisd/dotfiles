# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
export SHELL=/bin/zsh

#ZSH_THEME="muse"
#ZSH_THEME="amuse"
ZSH_THEME="nebirhos"
#ZSH_THEME="jnrowe"
#ZSH_THEME="junkfood"
#ZSH_THEME="kennethreitz"
#ZSH_THEME="pygmalion"
#ZSH_THEME="agnoster"
#ZSH_THEME="random"

plugins=(git brew django git-extras github history jira npm osx pip python rsync sublime coffee cp fabric git-flow gem gnu-utils go lein node rails ruby vagrant)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

for file in ~/.{extra,bash_prompt,exports,aliases,functions,airtime}; do
    [ -r "$file" ] && source "$file"
done
unset file

# Set VIM bindings for the command line 
set -o vi
bindkey '^R' history-incremental-pattern-search-backward

# Set Homebrew CoreUtils
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# Set CoreUtils Man Pages Path
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
