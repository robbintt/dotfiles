
### Begin: Global Defaults ###

#export PS1="🌊 "
export PS1="🔥 "  # aka <U+1F525>
#export PS1="$ "


# turn off pip unless you are in a virtualenv
# impacts ansible pip role if you aren't using sudo
#export PIP_REQUIRE_VIRTUALENV=true

# use vim in all the things
export VISUAL=vim
export EDITOR="$VISUAL"

# vi mode in command line
set -o vi

# private envvars
source ~/.envvars

### End: Global Defaults ###


if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi


### Begin: Platform Specific ###

# begin: set the platform
# from: https://stackoverflow.com/questions/394230/detect-the-os-from-a-bash-script
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='macos'
fi
# end: set the platform

# macos specific code
if [[ $platform == 'macos' ]]; then

    export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH:~/bin/

    # macos not cool friends
    export BASH_SILENCE_DEPRECATION_WARNING=1

    #export JAVA_HOME="$(dirname $(dirname $(realpath $(which javac))))"

    # from: https://stackoverflow.com/a/2403860
    #export JAVA_HOME=$(/usr/libexec/java_home)
    #export PATH=${JAVA_HOME}/bin:$PATH

    # add homebrew telnet for now
    #export PATH="/usr/local/opt/telnet/bin:$PATH"

    # macos homebrew bash-completion@2
    #if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
    #    . $(brew --prefix)/share/bash-completion/bash_completion
    #fi

# linux specific code
elif [[ $platform == 'linux' ]]; then
    # set variable identifying the chroot you work in (used in the prompt below)
    if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
        debian_chroot=$(cat /etc/debian_chroot)
    fi
    export PYENV_ROOT="$HOME/.pyenv/"
    if [ -d $PYENV_ROOT ]; then
        export PATH="${PYENV_ROOT}bin:$PATH"
    fi
    export PIPX_ROOT="$HOME/.local/"
    if [ -d $PIPX_ROOT ]; then
        export PATH="${PIPX_ROOT}bin:$PATH"
    fi
fi

### End: Platform Specific ###


# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"
fi

### Begin: NEEDS REVIEW ###

# FUTURE:
# http://askubuntu.com/questions/339546/how-do-i-see-the-history-of-the-commands-i-have-run-in-tmux
# Add this later, to preserve bash history
# FUTURE:
# Add a .pythonrc with `import rlcompleter import readline` for vim in python
# an inputrc example for future: https://github.com/whiteinge/dotfiles/blob/master/.inputrc

# If not running interactively, don't load: .bashrc
# NOTE: .bash_aliases loads from here
# NOTE: .bash_profile is symlinked here
case $- in
    *i*) ;;
      *) return;;
esac


# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi


# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

### End: NEEDS REVIEW ###


### Begin: Other Env Stuff ###

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# python pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# ruby rbenv
eval "$(rbenv init -)"

# golang - the little go book
export GOPATH=$HOME/code/go
export PATH=$PATH:$HOME/.go/go/bin # version these maybe or does asdf handle this?
export PATH=$PATH:$GOPATH/bin # version these maybe or does asdf handle this?

### End: Other Env Stuff ###
eval "$(direnv hook bash)"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# set the PATH to include cargo for rust if it exists
if [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

# Created by `pipx` on 2022-01-15 21:15:56
export PATH="$PATH:/home/robbintt/.local/bin"
