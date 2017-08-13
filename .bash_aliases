# Tip: You can use the `alias` command to see/remember all active aliases.

# this is stored in a private repo via symlink
if [ -f ~/.dotfiles/.irssi/irssi_bash_aliases ]; then
    . ~/.dotfiles/.irssi/irssi_bash_aliases
fi

# gnutools specific code
# require confirmation once on rm -r
if [[ $platform == 'linux' ]]; then
    alias rm="rm -i"
    # battery info - for linux
    alias batt='~/.dotfiles/snips/battery_info'
    # google chrome
    alias goo="google-chrome"
    # linux diskspace commands
    alias diskspace="du -sch .[!.]* * |sort -h"
    alias diskspace2="du -Sh | sort -n -r | less"
    # handbrake-gtk for ubuntu desktop
    alias handbrake="ghb"

# macos specific code
# macos version requires homebrew gnutools `grm` version 
elif [[ $platform == 'macos' ]]; then
    alias rm="grm -i"
    # macos version with homebrew gnutools and findtools g- prefix
    alias diskspace="du -sch .[!.]* * |gsort -h"
    alias diskspace2="du -Sh | gsort -n -r | less"
fi


### Not Platform Specific Commands

# get the weather
# help docs: `curl http://wttr.in/:help` 
function weather () {
    if [[ -z $1 ]] ; then
        curl http://wttr.in/94122?u
    else
        curl http://wttr.in/"$@"?u
    fi
}

# Convenience alias, found on the internets and touched up TAR 2015.
function cs () {
    cd "$@" && ls
}

# get stats - alias to help introspection with custom prompts
alias stats='echo `whoami;`"@"`hostname;`":"`pwd`'
alias s='echo `whoami;`"@"`hostname;`":"`pwd`'

# convert decimal to hex
alias dec2hex='python ~/.dotfiles/functions/dec2hex.py \$0'

#Tree aliases - from Greg Arenius 20170603
alias t="tree -L 1 -C"
alias ta="tree -L 1 -C -a"
alias t2="tree -L 2 -C"
alias tt="tree -L 2 -C"


# After 100 lookups, this is a lifesaver TAR 050115
alias lipsum='echo Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'

# This output belongs at the top of python 2 files.
alias pyutf8='echo \# -*- coding: utf-8\n -*-'

# for invoicing:
alias uuid="python -c 'import uuid; print(uuid.uuid4())'"

# For SICP ease; just use `scm < myfile.scheme` TAR 080115
alias scm='mit-scheme'

# break out of symlink
alias breakout='cd $(pwd -P)'

# estimated editor use: 30-50% of commands. save myself probably 100-200 keystrokes a day. TAR 120115
# we use f because it is on the homerow, `e` and `v` for mnemonic
f () { 
    command emacs -nw "$@" 
}
v () { 
    command vim "$@" 
}
e () { 
    command emacs -nw "$@" 
}
vim () { 
    echo ""
    echo "use shortcuts: v, e, f" 
    echo ""
}
emacs () { 
    echo ""
    echo "use shortcuts: v, e, f" 
    echo ""
}

# tmux - if no arguments given, then: if a session exists attach it, else make a session.
# IMPORTANT, this must be made in conjunction with the line:
# new-session -n $HOST
# in .tmux.conf -- this will fulfill the 'if no session, make new session' portion of this.
# this function/command is modified from: http://superuser.com/a/704510
# TAR Fall 2015
tmux () {
    if [[ -z $1 ]] ; then
        command tmux -2 attach
    else
        command tmux -2 "$@"
    fi
}

# some more ls aliases
alias ll='ls -alF'
# 2 below not used, is `la` or `l` practical?
alias la='ls -A'
alias l='ls -CF'

# map caps to esc
mapcaps(){
  xmodmap -e "clear lock"
  xmodmap -e "keycode 66 = Control_L"
  xmodmap -e "add Control = Control_L"
  echo mapcaps: caps-lock set to Control_L via xmodmap
}
unmapcaps(){
  xmodmap -e "keycode 66 = Caps_Lock"
  xmodmap -e "add lock = Caps_Lock"
  echo unmapcaps: caps-lock set to caps-lock via xmodmap
}


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# is this used? seems OK
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


