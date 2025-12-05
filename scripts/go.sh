#!/usr/bin/env bash

source ./config.env

GOROOT_VERSION=1.25.5
GO_VERSION=1.25.5

LOG_FILE=$(realpath $LOG_PATH/go.log)

echo "-----------"
echo "Building go"
echo "-----------"

cd "$BUILD_PATH" || exit 1
#
echo "Downloading..."
rm -f go${GOROOT_VERSION}.linux-amd64.tar.gz
wget https://go.dev/dl/go${GOROOT_VERSION}.linux-amd64.tar.gz &>"$LOG_FILE"
if [ ! $? -eq 0 ]; then
  echo "Failed to download" >&2
  exit 1
fi

echo "Extracting..."
tar -C "$INSTALL_PATH" -xzf go${GOROOT_VERSION}.linux-amd64.tar.gz &>>"$LOG_FILE"
rm -f go${GOROOT_VERSION}.linux-amd64.tar.gz
#mv "$INSTALL_PATH"/go "$INSTALL_PATH"/goroot
if [ ! $? -eq 0 ]; then
  echo "Failed to extract" >&2
  exit 1
fi

# echo "Downloading main..."
# rm -rf go &>>"$LOG_FILE"
# git clone https://go.googlesource.com/go go &>>"$LOG_FILE"
# if [ ! $? -eq 0 ]; then
#   echo "Failed to download go" >&2
#   exit 1
# fi
#
# cd go || exit 1
#
# echo "Compiling & installing main..."
# git fetch origin --tags &>>"$LOG_FILE"
# git checkout go${GO_VERSION} &>>"$LOG_FILE"
# cd src || exit 1
# export GOROOT_BOOTSTRAP=$INSTALL_PATH/goroot
# bash make.bash &>>"$LOG_FILE"
# cp ../bin/* "$INSTALL_PATH/bin" &>>"$LOG_FILE"
# if [ ! $? -eq 0 ]; then
#   echo "Failed to install go" >&2
#   exit 1
# fi
