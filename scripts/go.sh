#!/usr/bin/env bash

source "$(dirname "$0")/config.env"
setup_logging
log_header "Go"

GOROOT_VERSION=1.25.5

cd "$BUILD_PATH" || exit 1

run_and_log "Downloading Go" wget "https://go.dev/dl/go${GOROOT_VERSION}.linux-amd64.tar.gz" || exit 1

run_and_log "Extracting Go" tar -C "$INSTALL_PATH" -xzf "go${GOROOT_VERSION}.linux-amd64.tar.gz" || exit 1
rm -f "go${GOROOT_VERSION}.linux-amd64.tar.gz"

# echo "Downloading main..."
# rm -rf go &>>"$LOG_FILE"
# git clone https://go.googlesource.com/go go &>>"$LOG_FILE"
# if [ ! $? -eq 0 ]; then
#   echo "Failed to download go" >&2
#   exit 1
# fi
#
# cd go || exit 1
#
# echo "Compiling & installing main..."
# git fetch origin --tags &>>"$LOG_FILE"
# git checkout go${GO_VERSION} &>>"$LOG_FILE"
# cd src || exit 1
# export GOROOT_BOOTSTRAP=$INSTALL_PATH/goroot
# bash make.bash &>>"$LOG_FILE"
# cp ../bin/* "$INSTALL_PATH/bin" &>>"$LOG_FILE"
# if [ ! $? -eq 0 ]; then
#   echo "Failed to install go" >&2
#   exit 1
# fi
