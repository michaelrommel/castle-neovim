#! /bin/bash

if ! node --version >/dev/null 2>&1; then
	echo "Installing node"
	source "${HOME}/.path.d/20_fnm.sh"
	fnm install 'lts/*'
	fnm default lts-latest
fi

echo "Updating font cache"
fc-cache -f

