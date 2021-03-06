#! /usr/bin/env bash

# Files that should be symlinked from the home directory
to_link=(.bash_profile .bashrc .gitconfig .tmux.conf .vimrc)

# Directory containing this source file
df_dir="$HOME/.dotfiles"

# Git-clone dotfiles
git clone git@github.com:danieldulaney/dotfiles.git $df_dir

# Link to dotfiles
for file in "${to_link[@]}" ; do

    # If a symlink exists, just delete it
    if [ -h "$HOME/$file" ] ; then
        rm -f "$HOME/$file"

    # If any other file exists, rename it to .old
    elif [ -e "$HOME/$file" ] ; then
        mv "$HOME/$file" "$HOME/$file.old" 2> /dev/null
    fi

    # Create a new symlink
    ln -s "$df_dir/$file" "$HOME/$file"
done

