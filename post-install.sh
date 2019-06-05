#!/bin/bash

# Change default shell
if ! fgrep -q "/usr/local/bin/zsh" /etc/shells; then
  echo 'Changing default shell to zsh'
  echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
  chsh -s /usr/local/bin/zsh
else
  echo 'Already using zsh'
fi
