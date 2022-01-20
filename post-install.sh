#!/bin/bash

# Change default shell
if ! fgrep -q "/opt/homebrew/bin/zsh" /etc/shells; then
  echo 'Changing default shell to zsh'
  echo "/opt/homebrew/bin/zsh" | sudo tee -a /etc/shells
  chsh -s /opt/homebrew/bin/zsh
else
  echo 'Already using zsh'
fi
