#!/usr/bin/env bash

# REFERENCE: https://www.lua.org/manual/5.4/readme.html
source ./config.env
VERSION=3.12.2
LOG_FILE=$(realpath $LOG_PATH/luarocks.log)

echo "-----------------"
echo "Building Luarocks"
echo "-----------------"

echo "Downloading..."
cd $BUILD_PATH
wget https://luarocks.org/releases/luarocks-${VERSION}.tar.gz &>$LOG_FILE
if [ ! $? -eq 0 ]; then
  echo "Failed to download luarocks tar.gz" &>>2
  exit 1
fi
tar zxpf luarocks-${VERSION}.tar.gz &>>$LOG_FILE

echo "Configuring..."

cd luarocks-${VERSION}
./configure --with-lua=$INSTALL_PATH --prefix=$INSTALL_PATH &>>$LOG_FILE
if [ ! $? -eq 0 ]; then
  echo "Failed to configure luarocks" >&2
  exit 1
fi

echo "Compiling & Installing..."
(make && make install) &>>$LOG_FILE
if [ ! $? -eq 0 ]; then
  echo "Failed to compile and install luarocks tar.gz" >&2
  exit 1
fi
#sudo luarocks install luasocket
#lua
