ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Load zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions /Users/eriksf/.docker/completions $fpath)
autoload -Uz compinit && compinit

zinit cdreplay -q

# prompt stuff

#
# set mask
umask 022
ulimit unlimited

# Keybindings
#bindkey '^ ' autosuggest-accept
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history  # ensure history file visibility
SAVEHIST=$HISTSIZE
HISTDUP=erase
HSTR_CONFIG=hicolor        # get more colors
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# zsh-autosuggestions config
#ZSH_AUTOSUGGEST_USE_ASYNC=1
#ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

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

# fzf
eval "$(fzf --zsh)"

# zoxide
eval "$(zoxide init zsh)"

# pipx autocomplete
eval "$(register-python-argcomplete pipx)"

# Thefuck setup
eval "$(thefuck --alias)"
#
# uv
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
    eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/powerlevel10k_rainbow.omp.json)"
fi

source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/Users/eriksf/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/Users/eriksf/mambaforge/etc/profile.d/conda.sh" ]; then
#        . "/Users/eriksf/mambaforge/etc/profile.d/conda.sh"
#    else
#        export PATH="/Users/eriksf/mambaforge/bin:$PATH"
#    fi
#fi
#unset __conda_setup
#
#if [ -f "/Users/eriksf/mambaforge/etc/profile.d/mamba.sh" ]; then
#    . "/Users/eriksf/mambaforge/etc/profile.d/mamba.sh"
#fi
# <<< conda initialize <<<

# UVE shell integration
#source ~/.uve.sh

# fix completions for uv run.
_uv_run_mod() {
    if [[ "$words[2]" == "run" && "$words[CURRENT]" != -* ]]; then
        local venv_binaries
        if [[ -d .venv/bin ]]; then
            venv_binaries=( ${(@f)"$(_call_program files ls -1 .venv/bin 2>/dev/null)"} )
        fi
        #_arguments '*:filename:_files'
        _alternative \
            'files:filename:_files' \
            "binaries:venv binary:(($venv_binaries))"
    else
        _uv "$@"
    fi
}
#_uv_run_mod() {
#    if [[ "$words[2]" == "run" && "$words[CURRENT]" != -* ]]; then
#        # Check if any previous argument after 'run' ends with .py
#        if [[ ${words[3,$((CURRENT-1))]} =~ ".*\.py" ]]; then
#            # Already have a .py file, complete any files
#            _arguments '*:filename:_files'
#        else
#            # No .py file yet, complete only .py files
#            _arguments '*:filename:_files -g "*.py"'
#        fi
#    else
#        _uv "$@"
#    fi
#}
compdef _uv_run_mod uv

# bun
export BUN_INSTALL="$HOME/Library/Application Support/reflex/bun"
export PATH="$BUN_INSTALL/bin:$PATH"

