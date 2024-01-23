#!/bin/sh
for file in $(dirname $(readlink -f $0))/.*; do
    fn=$(basename $file)
    if [ -f $file ]; then
        if [ -e "$HOME/$fn" ]; then
            if [ -L "$HOME/$fn" ]; then
                echo "Remove existing symbolic link $HOME/$fn"
                rm -i "$HOME/$fn"
            else
                echo "Back up $HOME/$fn to $HOME/$fn.backup"
                mv -i "$HOME/$fn" "$HOME/$fn.backup"
            fi
        fi

        echo "Create symbolic link from $file to $HOME/$fn"
        ln -s -i "$file" "$HOME/$fn"
    fi
done
