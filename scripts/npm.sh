#!/usr/bin/env bash

source "$(dirname "$0")/config.env"
setup_logging
log_header "NPM"

VERSION=24

# Use shared NVM_DIR
export NVM_DIR="$INSTALL_ROOT/nvm"
mkdir -p "$NVM_DIR"

cd "$BUILD_PATH" || exit 1

mkdir -p nvm_installer && cd nvm_installer || exit 1
run_and_log "Downloading nvm installer" wget -v "https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh" || exit 1

run_and_log "Installing nvm" bash install.sh || exit 1

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
run_and_log "Installing node $VERSION" nvm install "$VERSION" || exit 1
