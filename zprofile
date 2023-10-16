# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zprofile.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zprofile.pre.zsh"
# TODO cleanup this file. it has tons of unrelated settings from various sources.
export ZSH_CACHE_DIR=$HOME/.zsh-plugins/ohmyzsh/ohmyzsh/cache

# Prefer US English and use UTF-8.
#export LANG='en_US.UTF-8';
#export LC_ALL='en_US.UTF-8';
#
export VIRTUAL_ENV_DISABLE_PROMPT=1
export GIT_INTERNAL_GETTEXT_TEST_FALLBACKS=1

#export NVM_DIR=~/.node
#export JAVA_HOME=`/usr/libexec/java_home -v 1.6`
#export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
#export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
#export JAVA_HOME=`/usr/libexec/java_home`
#export ANT_HOME=/Users/Shared/macports/share/java/apache-ant
#export ANT_OPTS="-server -XX:MaxPermSize=256M -Xmx1700m -XX:+UseParallelGC -Xms1700m -XX:SoftRefLRUPolicyMSPerMB=1 -XX: MaxHeapFreeRatio=99"
#export INPUTRC=$HOME/.inputrc
#export VIM_APP_DIR=/Applications
#export SVN_EDITOR=vi
export HTML_TIDY=$HOME/.tidy_config.txt

# virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel

#export HOMEBREW_GITHUB_API_TOKEN=`/usr/bin/security find-generic-password -gs HOMEBREW_GITHUB_API_TOKEN 2>&1 >/dev/null | grep password | cut -f 2 -d ' ' | egrep -o '[0-9a-fA-F]+' | tr -d "\n"`
export HOMEBREW_GITHUB_API_TOKEN=`security find-generic-password -s HOMEBREW_GITHUB_API_TOKEN -w`

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

# Avoid issues with `gpg` as installed via Homebrew.
# https://stackoverflow.com/a/42265848/96656
export GPG_TTY=$(tty);

# Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY=~/.node_history;
# Allow 32³ entries; the default is 1000.
export NODE_REPL_HISTORY_SIZE='32768';
# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE='sloppy';

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

# tvcl API key
export THETVDB_API_KEY=4BE21B103DDEDCC2

# add in m1 homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$HOME/go/bin:$HOME/sd2e-cloud-cli/bin:/$HOME/.yarn/bin:$HOME/.local/bin:$HOME/bin:$HOME/Devel/icommands/bin:/usr/local/m-cli:$HOME/Devel/git/ansible/bin:$PATH"
export PATH="$HOME/.tmux/plugins/tmuxifier/bin:$HOME/.yarn/bin:$HOME/.local/bin:$HOME/bin:$HOME/Devel/icommands/bin:/usr/local/m-cli:$PATH"
#eval "$(pyenv init --path)"
eval "$(tmuxifier init -)"

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# Set TMPDIR if the variable is not set/empty or the directory doesn't exist
if [[ -z "${TMPDIR}" ]]; then
  export TMPDIR="/tmp/zsh-${UID}"
fi

if [[ ! -d "${TMPDIR}" ]]; then
  mkdir -m 700 "${TMPDIR}"
fi

#export PATH="$HOME/.poetry/bin:$PATH"

# for python-build
#export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
#export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"
#export LDFLAGS="-L/opt/homebrew/lib -L/opt/homebrew/opt/openssl@1.1/lib"
#export CPPFLAGS="-I/opt/homebrew/include -I/opt/homebrew/opt/openssl@1.1/include"
export LDFLAGS="-L/opt/homebrew/lib"
export CPPFLAGS="-I/opt/homebrew/include"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zprofile.post.zsh" ]] && builtin source "$HOME/.fig/shell/zprofile.post.zsh"
