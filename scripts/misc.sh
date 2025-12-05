#!/usr/bin/env bash

source ./config.env

LOG_FILE=$(realpath $LOG_PATH/misc.log)

echo "-------------------"
echo "Building Misc Tools"
echo "-------------------"

echo 'Installing fd-find'
npm install -g fd-find &>"$LOG_FILE"
if [ ! $? -eq 0 ]; then
  echo "Failed to install fd-find" >&2
  exit 1
fi

echo 'Installing lazygit'
go install github.com/jesseduffield/lazygit@latest &>>"$LOG_FILE"
if [ ! $? -eq 0 ]; then
  echo "Failed to install lazygit" >&2
  exit 1
fi

echo 'Installing ripgrep'
cargo install ripgrep &>>"$LOG_FILE"
if [ ! $? -eq 0 ]; then
  echo "Failed to install ripgrep" >&2
  exit 1
fi

echo 'Installing ast-grep'
cargo install ast-grep &>>"$LOG_FILE"
if [ ! $? -eq 0 ]; then
  echo "Failed to install ast-grep" >&2
  exit 1
fi

echo 'Installing tectonic'
cargo install tectonic &>>"$LOG_FILE"
if [ ! $? -eq 0 ]; then
  echo "Failed to install tectonic" >&2
  exit 1
fi

echo 'Installing fzf'
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf &>>"$LOG_FILE"
~/.fzf/install &>>"$LOG_FILE"
if [ ! $? -eq 0 ]; then
  echo "Failed to install fzf" >&2
  exit 1
fi
