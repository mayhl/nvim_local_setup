#!/usr/bin/env bash

source "$(dirname "$0")/config.env"
setup_logging
log_header "Rust"

# Define shared Rust locations
export RUSTUP_HOME="$INSTALL_ROOT/rust/rustup"
export CARGO_HOME="$INSTALL_ROOT/rust/cargo"
mkdir -p "$RUSTUP_HOME" "$CARGO_HOME"

cd "$BUILD_PATH" || exit 1

# Download rustup installer
run_and_log "Downloading rustup" curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rustup.sh || exit 1

# Install non-interactively to the custom paths
run_and_log "Installing rust" sh rustup.sh -y --no-modify-path || exit 1
