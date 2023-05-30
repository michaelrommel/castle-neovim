#! /usr/bin/env bash

source "${HOME}/.homesick/helper.sh"

echo "Installing dependency packages"
if is_mac; then
	desired=(shellcheck@0.9 shfmt@1.33 fnm@1.33 universal-ctags
		fontconfig@2.14 python@3.11 tree-sitter@0.20 neovim@0.9)
	missing=()
	check_brewed "missing" "${desired[@]}"
	if [[ "${#missing[@]}" -gt 0 ]]; then
		echo "(brew) installing ${missing[*]}"
		brew install "${missing[@]}"
	fi
	if ! python3 -c 'import pip;' >/dev/null 2>&1; then
		# add pip3
		python3 -mensurepip
	fi
else
	desired=(curl git universal-ctags ninja-build gettext cmake unzip
		build-essential autoconf automake fontconfig python3-pip)
	missing=()
	check_dpkged "missing" "${desired[@]}"
	if [[ "${#missing[@]}" -gt 0 ]]; then
		echo "(apt) installing ${missing[*]}"
		sudo apt-get -y update
		sudo apt-get -y install "${missing[@]}"
	fi

	echo "Compiling and installing neovim"
	cd "${HOME}" || exit
	mkdir -p "${HOME}/software/"
	cd "${HOME}/software/" || exit
	git clone --filter=tree:0 https://github.com/neovim/neovim neovim_src
	cd neovim_src || exit
	git checkout stable
	make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=${HOME}/software/neovim"
	make install
fi

if ! fnm -V >/dev/null 2>&1; then
	echo "Installing the fast Node Manager (fnm)"
	cd "${HOME}" || exit
	curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash -s -- --skip-shell
fi

if ! rustup -V >/dev/null 2>&1; then
	echo "Installing rust"
	curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
	export PATH="${HOME}/.cargo/bin:${PATH}"
	rustup default stable
fi

if ! tree-sitter -V >/dev/null 2>&1; then
	echo "Installing tree-sitter cli"
	cargo install tree-sitter-cli
fi

if ! python3 -c 'import pynvim;' >/dev/null 2>&1; then
	echo "Installing python neovim module"
	python3 -mpip install pynvim
fi

if ! nvr --version >/dev/null 2>&1; then
	echo "Installing neovim-remote"
	python3 -mpip install neovim-remote
fi
