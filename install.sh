#!/bin/bash

# creates symlinks for desired files from home to specified directory

dir=~/dotfiles
olddir=~/.dotfiles.bak

# list of files/folders to symlink in homedir
files="bashrc bash_profile bash_aliases vim vimrc ideavimrc"
#installs vundle
cd ~
git clone https://github.com/gmarik/Vundle.vim.git $dir/vim/bundle/Vundle.vim

echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
for file in $files; do
    cd $dir
    cd ~
    echo "Moving existing $file from ~ to $olddir"
    mv .$file $olddir
    echo "Creating symlink to $file in `pwd`"
    ln -s $dir/$file .$file
done

vim +PluginInstall +qall
