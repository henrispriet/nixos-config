#!/usr/bin/env bash

# A rebuild script that updates the flake.lock file
set -euo pipefail

pushd ~/nixos-config/ > /dev/null
trap "popd > /dev/null" EXIT

# Early return if unstaged changes were detected
if ! git diff --quiet '*.nix'; then
    echo "Unstaged changes, please commit/stash them before updating the flake"
    exit 0
fi

echo "Updating flake..."
nix flake update

if git diff --quiet 'flake.lock'; then
    echo "No updates available to flake.lock"
    exit 0
 fi

./build-system.sh \
|| (git restore --staged . && exit 1)

# Commit lock changes
git add flake.lock
git commit -m "update flake.lock"

# Notify all OK!
notify-send -e "NixOS flake update OK!" --icon=software-update-available
