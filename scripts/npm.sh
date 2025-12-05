#!/usr/bin/env bash

source ./config.env
VERSION=24
LOG_FILE=$(realpath $LOG_PATH/npm.log)

echo "------------"
echo "Building npm"
echo "------------"

echo "Downloading..."
cd $BUILD_PATH

mkdir -p nvm && cd nvm
#TODO: Add back after testing
#curl -v "https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh" &>$LOG_FILE

echo "DUMMY INSTALL" &>$LOG_FILE
if [ ! $? -eq 0 ]; then
  echo "Failed to download nvm" >&2
  exit 1
fi

bash install.sh &>>$LOG_FILE

if [ ! $? -eq 0 ]; then
  echo "Failed to install nvm" >&2
  exit 1
fi
#source envirment

#export NVM_DIR="$HOME/.nvm"
echo "Installing..."

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

nvm install $VERSION &>>$LOG_FILE

if [ ! $? -eq 0 ]; then
  echo "Failed to install npm" >&2
  exit 1
fi
#npm i @ast-grep/cli -g
