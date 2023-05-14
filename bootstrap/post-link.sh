#! /bin/bash

echo "Updating font cache"
fc-cache -f

echo "Installing node"
source "${HOME}/.path.d/20_fnm.sh"
fnm install 'lts/*'
fnm default lts-latest
