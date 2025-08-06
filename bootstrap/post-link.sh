#! /usr/bin/env bash

source "${HOME}/.homesick/helper.sh"

# paths for mise and shims
source "${HOME}/.path.d/50_mise.bash"
source "${HOME}/.path.d/99_default.sh"

if ! is_mac; then
	echo "Updating font cache"
	fc-cache -f
fi
