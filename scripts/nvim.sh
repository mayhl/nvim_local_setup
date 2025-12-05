#!/usr/bin/env bash


source ./config.env

BUILD_TYPE="RelWithDebInfo"
REPO_URL="https://github.com/neovim/neovim.git"

echo "----------------"
echo " Building Neovim"
echo "----------------"

LOG_FILE=$(realpath $LOG_PATH/nvim.log)

echo " Downloading ..."
cd $BUILD_PATH
rm -rf neovim
git clone $REPO_URL &> $LOG_FILE
if [ ! $? -eq 0 ]; then
	echo "Failed to download nvim repo" >&2
	exit 1
fi

echo " Compiling ..."
cd neovim
make CMAKE_BUILD_TYPE=$BUILD_TYPE  CMAKE_INSTALL_PREFIX=$INSTALL_PATH &>> $LOG_FILE
if [ ! $? -eq 0 ]; then
	echo "Failed to compile nvim" >&2
	exit 1
fi


echo " Installing ..."
make install &>> $LOG_FILE

if [ ! $? -eq 0 ]; then
	echo "Failed to install nvim" >&2
	exit 1
fi
