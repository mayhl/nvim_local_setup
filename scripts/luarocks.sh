#!/usr/bin/env bash

# REFERENCE: https://www.lua.org/manual/5.4/readme.html
source "$(dirname "$0")/config.env"
setup_logging
log_header "Luarocks"

VERSION=3.12.2

# Check for lua dependency
if ! command -v lua &> /dev/null; then
  echo "Error: lua binary not found in PATH. Ensure lua.sh was run successfully." >&2
  exit 1
fi

cd "$BUILD_PATH" || exit 1
run_and_log "Downloading Luarocks" wget "https://luarocks.org/releases/luarocks-${VERSION}.tar.gz" || exit 1
tar zxpf "luarocks-${VERSION}.tar.gz" &>>"$LOG_FILE"

cd "luarocks-${VERSION}" || exit 1
run_and_log "Configuring Luarocks" ./configure --with-lua="$INSTALL_ROOT" --prefix="$INSTALL_PATH" || exit 1

run_and_log "Compiling & Installing Luarocks" make install || exit 1
