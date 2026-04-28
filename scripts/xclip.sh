#!/usr/bin/env bash

#REFERENCE: https://github.com/astrand/xclip/blob/master/INSTALL
source "$(dirname "$0")/config.env"
setup_logging
log_header "xclip"

cd "$BUILD_PATH" || exit 1

rm -rf xclip
run_and_log "Downloading xclip" git clone https://github.com/astrand/xclip.git || exit 1

cd xclip || exit 1

run_and_log "Configuring xclip" autoreconf
run_and_log "Configuring xclip" ./configure --prefix="$INSTALL_PATH" || exit 1

run_and_log "Compiling xclip" make || exit 1

run_and_log "Installing xclip" make install || exit 1
