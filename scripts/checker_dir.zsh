#!/usr/bin/zsh

for i; do
    if [[ -d $i ]] then
        if read -q "choice? $i is a directory, are you sure you want to delete it?"; then
            gio trash $i
            echo
        else
            echo "'$choice' not 'Y' or 'y'. Exiting..."
        fi
    elif [[ -e $i ]] then
            gio trash $i
    else
        echo "$i is not a valid file"
    fi
done
