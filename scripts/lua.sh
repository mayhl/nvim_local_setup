#!/usr/bin/env bash

# REFERENCE: https://www.lua.org/manual/5.4/readme.html
source "$(dirname "$0")/config.env"
setup_logging
log_header "Lua"

VERSION=5.1.5

cd "$BUILD_PATH" || exit 1
run_and_log "Downloading Lua" curl -L -R -O "https://www.lua.org/ftp/lua-${VERSION}.tar.gz" || exit 1

tar zxf "lua-${VERSION}.tar.gz" &>>"$LOG_FILE"
rm "lua-${VERSION}.tar.gz"

cd "lua-${VERSION}" || exit 1
run_and_log "Compiling & Installing Lua" make linux install INSTALL_TOP="$INSTALL_PATH" || exit 1
