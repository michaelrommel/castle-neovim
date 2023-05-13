#! /bin/bash

echo "Installing apt packages"
sudo apt-get -y update
sudo apt-get -y install git curl ninja-build gettext cmake unzip \
	build-essential autoconf automake universal-ctags || exit
# 	libevent-dev libncurses5-dev bison byacc tmux vim \
# 	mosh keychain ncurses-bin gdebi-core apt-file \
# 	sysstat net-tools dnsutils \
# 	python3-pip  software-properties-common \
# 	bc dh-autoreconf libcurl4-gnutls-dev libexpat1-dev \
# 	gawk gettext libz-dev libssl-dev install-info || exit

echo "Installing ripgrep from github"
# provides a fast recursive grep
cd "${HOME}" || exit
mkdir -p "${HOME}/software/archives"
cd "${HOME}/software/archives" || exit
curl -OL https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb
sudo dpkg -i "${HOME}/software/archives/ripgrep_12.1.1_amd64.deb"

echo "Installing fd from github"
# provides faster find version, not available for Ubuntu 18.04
cd "${HOME}" || exit
mkdir -p "${HOME}/software/archives"
cd "${HOME}/software/archives" || exit
curl -OL https://github.com/sharkdp/fd/releases/download/v8.1.1/fd_8.1.1_amd64.deb
sudo dpkg -i "${HOME}/software/archives/fd_8.1.1_amd64.deb"

echo "Installing bat from github"
# provides syntax highlighting pager
cd "${HOME}" || exit
mkdir -p "${HOME}/software/archives"
cd "${HOME}/software/archives" || exit
curl -OL https://github.com/sharkdp/bat/releases/download/v0.17.1/bat_0.17.1_amd64.deb
sudo dpkg -i "${HOME}/software/archives/bat_0.17.1_amd64.deb"

echo "Installing bat-extras from github"
cd "${HOME}" || exit
git clone --depth 1 https://github.com/eth-p/bat-extras.git "${HOME}/.bat"

echo "Installing fzf from github"
# needs to come before zsh, as we are sourceing completion & keybindings there
cd "${HOME}" || exit
git clone --depth 1 https://github.com/junegunn/fzf.git "${HOME}/.fzf"
"${HOME}/.fzf/install" --no-key-bindings --no-completion --no-update-rc --no-bash --no-zsh --no-fish

echo "Compiling and installing neovim"
cd "${HOME}" || exit
mkdir -p "${HOME}/software/"
cd "${HOME}/software/" || exit
git clone https://github.com/neovim/neovim neovim_src
cd neovim_src || exit
git checkout stable
make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=${HOME}/software/neovim"
make install

echo "Installing rust"
curl https://sh.rustup.rs -sSf | sh -s -- -y
export PATH="${HOME}/.cargo/bin:${PATH}"

echo "Installing tree-sitter cli"
cargo install tree-sitter-cli

echo "Installing shellcheck"
mkdir -p "${HOME}/software"
cd "${HOME}/software" || exit
scversion="stable" # or "v0.4.7", or "latest"
curl -sL "https://github.com/koalaman/shellcheck/releases/download/${scversion?}/shellcheck-${scversion?}.linux.x86_64.tar.xz" | tar -xJ
# sudo cp "shellcheck-${scversion}/shellcheck" /usr/bin/
