#! /bin/bash

if [[ -d "${HOME}/.cargo/bin" && ! ":${PATH}:" == *:${HOME}/.cargo/bin:* ]]; then
	# path has not yet been added
	export PATH="${HOME}/.cargo/bin:${PATH}"
fi

# Auto-completion
# ---------------
if [[ $- == *i* && -d "${HOME}/.cargo/shell" ]]; then
	fpath=(${HOME}/.cargo/shell $fpath)
fi
