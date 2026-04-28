#!/usr/bin/env bash

# Use the shared location provided by the environment or default
export INSTALL_ROOT="${INSTALL_ROOT:-$HOME/opt/nvim_stack}"
export LOG_PATH="${INSTALL_ROOT}/log"
export PATH="${INSTALL_ROOT}/bin:$PATH"

mkdir -p "$INSTALL_ROOT" "$LOG_PATH"

echo "Starting installation into: $INSTALL_ROOT"

# Run installation scripts
./scripts/bob_install.sh
./scripts/lua.sh
./scripts/luarocks.sh
./scripts/go.sh
./scripts/npm.sh
./scripts/rust.sh
./scripts/xclip.sh
./scripts/misc.sh

echo "------------------------------------------------"
echo "Installation complete."
echo "Add this to your Tcl module file:"
echo "  prepend-path PATH ${INSTALL_ROOT}/bin"
echo "  prepend-path PATH ${INSTALL_ROOT}/bob/nvim-bin"
echo "------------------------------------------------"
