#!/usr/bin/env bash

set -euo pipefail

pushd ~/nixos-config/ > /dev/null
trap "popd > /dev/null && git restore --staged ." EXIT

# format
alejandra . &>/dev/null \
  || (alejandra . ; echo "formatting failed!" && exit 1)

echo "NixOS Rebuilding..."
# make sure new files are detected by the rebuild
git add .
# Rebuild, output simplified errors, log trackebacks
sudo nixos-rebuild test --flake ".#myNixos" 2>&1 \
  # FIXME:
  # | grep -e "(error|warning)" --color
