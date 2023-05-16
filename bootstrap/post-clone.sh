#! /bin/bash

echo "Installing apt packages"
sudo apt-get -y update
sudo apt-get -y install git curl ninja-build gettext cmake unzip \
	build-essential autoconf automake universal-ctags \
	fontconfig python3-pip || exit

echo "Compiling and installing neovim"
cd "${HOME}" || exit
mkdir -p "${HOME}/software/"
cd "${HOME}/software/" || exit
git clone https://github.com/neovim/neovim neovim_src
cd neovim_src || exit
git checkout stable
make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=${HOME}/software/neovim"
make install

if ! fnm -V >/dev/null 2>&1; then
	echo "Installing the fast Node Manager (fnm)"
	cd "${HOME}" || exit
	curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash -s -- --skip-shell
fi

if ! rustup -V >/dev/null 2>&1; then
	echo "Installing rust"
	curl https://sh.rustup.rs -sSf | sh -s -- -y
	export PATH="${HOME}/.cargo/bin:${PATH}"
	rustup default stable
fi

echo "Installing tree-sitter cli"
cargo install tree-sitter-cli

echo "Installing python neovim module"
python3 -mpip install neovim

echo "Installing neovim-remote"
python3 -mpip install neovim-remote

