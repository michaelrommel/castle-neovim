#! /bin/bash

echo "Updating font cache"
fc-cache -f

echo "Installing node"
source "${HOME}/.fnm.sh"
fnm install 'lts/*'
fnm default lts-latest
