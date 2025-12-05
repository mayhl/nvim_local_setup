#!/usr/env/bin bash

source ./config.env

LOG_FILE=$(realpath "$LOG_PATH"/rust.log)

echo "-------------"
echo "Building rust"
echo "-------------"

echo "Downloading..."
cd "$BUILD_PATH" || exit 1
mkdir -p rust
cd rust || exit 1
rm --f install.sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o install.sh &>"$LOG_FILE"
if [ ! $? -eq 0 ]; then
  echo "Failed to download rust" >&2
  exit 1
fi

echo "Installing..."
sh install.sh -y &>>"$LOG_FILE"
if [ ! $? -eq 0 ]; then
  echo "Failed to install rust" >&2
  exit 1
fi
