#!/usr/bin/env bash

# Centralized installation root for the nvim toolstack
export STACK_ROOT="${HOME}/opt/nvim_stack"
export BUILD_PATH="${HOME}/opt/build"
export LOG_PATH="${HOME}/logs/nvim_install"

mkdir -p "$STACK_ROOT" "$BUILD_PATH" "$LOG_PATH"

echo "Starting Neovim Toolstack installation into: $STACK_ROOT"

# Run individual build scripts in order of dependency
# (We assume these scripts are updated to use $STACK_ROOT)
./scripts/lua.sh
./scripts/luarocks.sh
./scripts/go.sh
./scripts/npm.sh
./scripts/rust.sh
./scripts/xclip.sh
./scripts/nvim.sh

echo "------------------------------------------------"
echo "Toolstack installation complete."
echo "Add this to your Tcl module file:"
echo "  prepend-path PATH ${STACK_ROOT}/bin"
echo "  setenv LUA_PATH '${STACK_ROOT}/share/lua/5.1/?.lua;;'"
echo "------------------------------------------------"
