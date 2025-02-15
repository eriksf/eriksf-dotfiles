# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# set mask
umask 022
ulimit unlimited

# Load znap
source ~/.zsh-plugins/zsh-snap/znap.zsh

# Load zsh plugins
znap source romkatv/powerlevel10k
znap source asdf-vm/asdf

# zsh-autosuggestions config
bindkey '^ ' autosuggest-accept
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
znap source zsh-users/zsh-autosuggestions

znap source zsh-users/zsh-syntax-highlighting

znap source sparsick/ansible-zsh
znap source apachler/zsh-aws

# plugins from oh-my-zsh
znap source ohmyzsh/ohmyzsh \
    plugins/docker \
    plugins/docker-compose \
    plugins/git \
    plugins/golang \
    plugins/iterm2 \
    plugins/direnv \
    plugins/poetry \
    plugins/z \
    lib/history.zsh

znap eval colors $(gdircolors ~/.dircolors/dircolors.ansi-light)

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
source ~/eriksf-dotfiles/aliases
source ~/eriksf-dotfiles/functions

# VIM as default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# add this configuration to ~/.zshrc
export HISTFILE=~/.zsh_history  # ensure history file visibility
export HSTR_CONFIG=hicolor        # get more colors
bindkey -s "\C-r" "\eqhh\n"     # bind hh to Ctrl-r (for Vi mode check doc)

# remove history sharing
unsetopt share_history

# pipx autocomplete
znap eval pipx "$(register-python-argcomplete pipx)"

# Thefuck setup
znap eval thefuck "$(thefuck --alias)"

if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
    znap eval iterm2 'curl -fsSL https://iterm2.com/shell_integration/zsh'
fi

bash $HOME/.motd

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/eriksf/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/eriksf/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/Users/eriksf/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/Users/eriksf/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/eriksf/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/Users/eriksf/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh"
