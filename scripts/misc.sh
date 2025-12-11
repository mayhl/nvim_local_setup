#!/usr/bin/env bash

source ./config.env

LOG_FILE=$(realpath $LOG_PATH/misc.log)

function install() {

  local NAME=$1
  local CMD=$2

  echo "Installing ${NAME}..."
  #${CMD} &>"$LOG_FILE"

  if $CMD &>>"$LOG_FILE"; then
    echo "  Successfully installed ${NAME}"
  else
    echo "  Failed to install ${NAME}!"
  fi

}

echo "-------------------"
echo "Building Misc Tools"
echo "-------------------"

echo "" >"$LOG_FILE"

install "fd-find" "npm install -g fd-find"

install "lazygit" "go install github.com/jesseduffield/lazygit@latest"

install "bat" "cargo install bat"
install "eza" "cargo install eza"
install "ripgrep" "cargo install ripgrep"
install "ast-grep" "cargo install ast-grep"
install "tectonic" "cargo install tectonic"

CMD="git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install"
install "fzf" "$CMD"
