
# A zsh guide: http://zsh.sourceforge.net/Guide/zshguide.html
#
# zsh vs bash on reddit: https://www.reddit.com/r/linux/comments/1csl7c/bash_vs_zsh/

# redo isn't bound by default, undo is too heavily chorded as ^_
bindkey "^z" undo
bindkey "^y" redo

# allow inline comments when in the shell
setopt interactivecomments
