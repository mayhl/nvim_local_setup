#!/usr/bin/env bash

# REFERENCE: https://www.lua.org/manual/5.4/readme.html
source ./config.env

VERSION=5.1.5

echo "------------"
echo "Building Lua"
echo "------------"

LOG_FILE=$(realpath $LOG_PATH/lua.log)

echo "Downloading..."
cd $BUILD_PATH
curl -L -R -O https://www.lua.org/ftp/lua-${VERSION}.tar.gz &>>$LOG_FILE
if [ ! $? -eq 0 ]; then
  echo "Failed to download lua tar.gz" >&2
  exit 1
fi
tar zxf lua-${VERSION}.tar.gz &>LOG_FILE
rm lua-${VERSION}.tar.gz

echo "Compiling & Installing..."
cd lua-${VERSION}
make linux install INSTALL_TOP=$INSTALL_PATH &>>$LOG_FILE

if [ ! $? -eq 0 ]; then
  echo "Failed to compile & install nvim" >&2
  exit 1
fi
