#!/usr/bin/env bash
#
# Adapted from https://gist.github.com/0atman/1a5133b842f929ba4c1e195ee67599d5
# A rebuild script that commits on a successful build
#
set -euo pipefail

pushd ~/nixos-config/ > /dev/null
trap "popd > /dev/null" EXIT

# Early return if no changes were detected (thanks @singiamtel!)
if git diff --quiet '*.nix'; then
    echo "No changes detected, exiting."
    exit 0
fi

# Autoformat your nix files
alejandra . &>/dev/null \
  || (alejandra . ; echo "formatting failed!" && exit 1)

# Shows your changes
git diff -U0 '*.nix'

./build-system.sh \
  || (git restore --staged . && exit 1)

# Get current generation metadata
current=$(nixos-rebuild list-generations | grep current | cut -d " " -f 1)

# Commit all changes witih the generation metadata
git commit -m "generation ${current}"

# Notify all OK!
notify-send -e "NixOS Rebuilt OK!" --icon=software-update-available
