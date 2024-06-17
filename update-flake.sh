#!/usr/bin/env bash

# A rebuild script that updates the flake.lock file
set -e

# cd to your config dir
pushd ~/nixos-config/

# Early return if unstaged changes were detected
if ! git diff --quiet '*.nix'; then
    echo "Unstaged changes, please commit them before updating the flake"
    popd
    exit 0
fi

echo "Updating flake..."
nix flake update

if git diff --quiet 'flake.lock'; then
    echo "No updates available to flake.lock"
    popd
    exit 0
 fi

echo "NixOS Rebuilding..."
# Rebuild, output simplified errors, log trackebacks
logfile=$(mktemp)
echo "(full logs can be found in $logfile)"
sudo nixos-rebuild switch --flake .#myNixos &>$logfile || \
(cat $logfile | grep --color error \
&& git restore --staged .\
&& exit 1)

# Commit all changes witih the generation metadata
git add flake.lock
git commit -m "update flake.lock"

# Back to where you were
popd

# Notify all OK!
notify-send -e "NixOS flake update OK!" --icon=software-update-available
