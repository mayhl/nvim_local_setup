#!/usr/bin/env bash

source "$(dirname "$0")/config.env"
setup_logging
log_header "Misc Tools"

# Ensure environment is loaded for tools
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

function install() {
  local NAME=$1
  local CMD=$2
  run_and_log "Installing ${NAME}" eval "$CMD"
}

# Tools using NPM (now respects our shared NVM_DIR)
install "fd-find" "npm install -g fd-find"

# Tools using Go (now respects our shared GOROOT/bin)
# Ensure go is in PATH for this session
export PATH="$PATH:$INSTALL_ROOT/go/bin"
install "lazygit" "go install github.com/jesseduffield/lazygit@latest"

# Tools using Cargo (now respects our shared CARGO_HOME)
install "bat" "cargo install bat"
install "eza" "cargo install eza"
install "ripgrep" "cargo install ripgrep"
install "ast-grep" "cargo install ast-grep"
install "tectonic" "cargo install tectonic"

# fzf (now installs into INSTALL_ROOT)
CMD="git clone --depth 1 https://github.com/junegunn/fzf.git $INSTALL_ROOT/fzf && $INSTALL_ROOT/fzf/install --bin"
install "fzf" "$CMD"
