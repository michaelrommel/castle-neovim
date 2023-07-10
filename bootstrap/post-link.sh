#! /usr/bin/env bash

source "${HOME}/.homesick/helper.sh"

# paths for rtx and shims
source "${HOME}/.path.d/50_rtx.bash"
source "${HOME}/.path.d/99_default.sh"

if ! node --version >/dev/null 2>&1; then
	echo "Installing node"
	rtx install node@latest
	rtx use -g node@latest
fi

if ! is_mac; then
	echo "Updating font cache"
	fc-cache -f
fi
