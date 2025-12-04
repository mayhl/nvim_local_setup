#!/usr/bin/env bash

set -x

BUILD_PATH=build
INSTALL_PATH=$HOME/.local
BUILD_TYPE="RelWithDebInfo"

REPO_URL="https://github.com/neovim/neovim.git"
local build_path=$BUILD_PATH/nvim

echo "----------------"
echo " Building Neovim"
echo "----------------"

echo " Compiling ..."

# git clone https://github.com/neovim/neovim.git
# make  CMAKE_BUILD_TYPE=$BUILD_TYPE  CMAKE_INSTALL_PREFIX=$INSTALL_PATH
