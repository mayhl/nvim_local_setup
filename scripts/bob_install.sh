#!/usr/bin/env bash

source "$(dirname "$0")/config.env"
setup_logging
log_header "Bob"

# Setup directory structure for shared installation
export BIN_DIR="$INSTALL_ROOT/bin"
export BOB_DIR="$INSTALL_ROOT/bob"

echo "Setting up environment in: $INSTALL_ROOT"
mkdir -p "$BIN_DIR" "$BOB_DIR"

# Download bob binary (assuming Linux x86_64 for now, can be made generic if needed)
run_and_log "Downloading bob" curl -L https://github.com/MordechaiHadad/bob/releases/latest/download/bob-linux-x86_64 -o "$BIN_DIR/bob" || exit 1
chmod +x "$BIN_DIR/bob"

# Initialize bob in the specified directory
export BOB_DATA_DIR="$BOB_DIR"
run_and_log "Installing stable neovim" "$BIN_DIR/bob" install stable || exit 1
run_and_log "Switching to stable neovim" "$BIN_DIR/bob" use stable || exit 1

echo "Bob installed at $BIN_DIR/bob"
echo "Make sure to add $INSTALL_ROOT/bob/nvim-bin to your PATH in your TCL module."
