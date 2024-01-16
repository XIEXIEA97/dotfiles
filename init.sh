#!/bin/sh
for file in .*; do
    if [ -f $file ]; then
        if [ -e "$HOME/$file" ]; then
            if [ -L "$HOME/$file" ]; then
                rm "$HOME/$file"
                echo "Removed existing symbolic link $HOME/$file"
            else
                mv -i "$HOME/$file" "$HOME/$file.backup"
                echo "Backuped $HOME/$file to $HOME/$file.backup"
            fi
        fi

        ln -s "$(pwd)/$file" "$HOME/$file"
        echo "Created symbolic link from $file to $HOME/$file"
    fi
done
