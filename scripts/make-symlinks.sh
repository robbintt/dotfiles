#!/bin/bash

### This shouldn't be used, it is superceded by ansible roles

### NOTE: Changes to this file should be reflected in ansible adminuser roles.

echo "***"
echo "*** There may be failures associated with terminalrc on headless systems. This can be ignored."
echo "*** irssi mv failures are normal if it is not installed or the files didn't already exist. This can be tested later but failing has no consequence."
echo "*** THIS DOES NOT DO .config/i3/ i3wm folder, manually link these."
echo "***"

## Font folder in $HOME can be added and loaded here optionally. Fonts already in dotfiles.


mkdir ~/.old_dotfiles
mkdir ~/.old_dotfiles/.ssh
mkdir ~/.old_dotfiles/.irssi
mkdir -p ~/.old_dotfiles/.config/i3
mkdir -p ~/.old_dotfiles/.config/xfce4/terminal
# used for vim plugins etc.
mkdir -p ~/.vim
# necessary for vim undo, must be the same as the .vimrc `undodir` setting
mkdir -p ~/.vim/undodir

mv ~/.bashrc ~/.old_dotfiles/
mv ~/.zshrc ~/.old_dotfiles/
mv ~/.inputrc ~/.old_dotfiles/

mv ~/.gitconfig ~/.old_dotfiles/
mv ~/.bash_aliases ~/.old_dotfiles/
mv ~/.bash_profile ~/.old_dotfiles/
mv ~/.vimrc ~/.old_dotfiles/
mv ~/.ssh/config ~/.old_dotfiles/.ssh/
mv ~/.irssi/ ~/.old_dotfiles/
mv ~/.tmux.conf ~/.old_dotfiles/
mv ~/.config/xfce4/terminal/terminalrc ~/.old_dotfiles/.config/xfce4/terminal/
mv ~/.config/redshift.conf ~/.old_dotfiles/.config/
mv ~/.config/i3/ ~/.old_dotfiles/.config/i3/

ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.inputrc ~/.inputrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.bash_aliases ~/.bash_aliases
ln -s ~/.dotfiles/.bash_profile ~/.bash_profile
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.ssh/config ~/.ssh/config
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.irssi/ ~/.irssi
ln -s ~/dotfiles/UltiSnips/ ~/.vim/UltiSnips

mkdir -p ~/.config/xfce4/terminal
ln -s ~/.dotfiles/.config/xfce4/terminal/terminalrc ~/.config/xfce4/terminal/terminalrc
mkdir -p ~/.config/i3
ln -s ~/.dotfiles/.config/i3/* ~/.config/i3/

ln -s ~/.dotfiles/redshift.conf ~/.config/redshift.conf

