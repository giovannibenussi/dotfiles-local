#!/bin/bash

if [[ -f ~/.ackrc ]]; then
    echo "\033[33mError: The ~/.ackrc file already exists.\033[0m"
    exit 1
fi

ln -s ~/dotfiles/.ackrc ~/.ackrc

echo "\033[32mAlias created successfully!\033[0m"
