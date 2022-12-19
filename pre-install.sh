#!/bin/bash

# Check if Homebrew is installed
if [ ! -f "`which brew`" ]; then
  echo 'Installing homebrew'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  #/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo 'Updating homebrew'
  brew update -v
fi
brew tap homebrew/bundle  # Install Homebrew Bundle

# Check if znap is installed
ZNAPDIR="$HOME/.zsh-plugins"
if [ ! -d "$ZNAPDIR" ]; then
  echo 'Installing znap'
  mkdir -p $ZNAPDIR
  cd $ZNAPDIR
  git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git
  source zsh-snap/install.sh
else
  echo 'Updating znap'
  znap pull
fi

# Check if Mac-CLI is installed
#if [ ! -f "which mac" ]; then
#    echo 'Installing Mac-CLI'
#    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/guarinogabriel/mac-cli/master/mac-cli/tools/install)"
#else
#    echo 'Updating Mac-CLI'
#    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/guarinogabriel/mac-cli/master/mac-cli/tools/update)"
#fi

