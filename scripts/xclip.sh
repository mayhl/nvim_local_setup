#!/usr/bin/env bash

#REFERENCE: https://github.com/astrand/xclip/blob/master/INSTALL
source ./config.env

LOG_FILE=$(realpath $LOG_PATH/xclip.log)

echo "--------------"
echo "Building xclip"
echo "--------------"

cd $BUILD_PATH || exit 1

echo "Downloading..."

rm -rf xclip
git clone https://github.com/astrand/xclip.git &>"$LOG_FILE"
if [ ! $? -eq 0 ]; then
  echo "Failed to download xclip" >&2
  exit 1
fi

cd xclip || exit 1

echo "Configuring..."
autoreconf
./configure --prefix="$INSTALL_PATH" &>>"$LOG_FILE"
if [ ! $? -eq 0 ]; then
  echo "Failed to configure" >&2
  exit 1
fi

echo "Compiling..."
make &>>"$LOG_FILE"
if [ ! $? -eq 0 ]; then
  echo "Failed to compile" >&2
  exit 1
fi

echo "Installing..."
make install &>>"$LOG_FILE"
if [ ! $? -eq 0 ]; then
  echo "Failed to install" >&2
  exit 1
fi
