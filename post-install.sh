#!/bin/bash

# check architecture
ARCH=$(uname -m)
if [[ "$ARCH" == "arm64" ]]; then
    MYZSH=/opt/homebrew/bin/zsh
else
    MYZSH=/usr/local/bin/zsh
fi

# Change default shell
if ! fgrep -q "$MYZSH" /etc/shells; then
  echo 'Changing default shell to zsh'
  echo "$MYZSH" | sudo tee -a /etc/shells
  chsh -s $MYZSH
else
  echo 'Already using zsh'
fi
