#!/usr/bin/env bash
#
# Adapted from https://gist.github.com/0atman/1a5133b842f929ba4c1e195ee67599d5

# A rebuild script that commits on a successful build
set -e

# Edit your config
# $EDITOR configuration.nix

# cd to your config dir
pushd ~/nixos-config/

# Early return if no changes were detected (thanks @singiamtel!)
if git diff --quiet '*.nix'; then
    echo "No changes detected, exiting."
    popd
    exit 0
fi

# Autoformat your nix files
alejandra . &>/dev/null \
  || ( alejandra . ; echo "formatting failed!" && exit 1)

# Shows your changes
git diff -U0 '*.nix'

echo "NixOS Rebuilding..."

# Rebuild, output simplified errors, log trackebacks
logfile=$(mktemp)
# make sure new files are detected by the rebuild
git add .
sudo nixos-rebuild switch --flake .#myNixos &>$logfile || \
(cat $logfile | grep --color error \
&& echo "full logs can be found in $logfile" \
&& git restore --staged .\
&& exit 1)

# Get current generation metadata
current=$(nixos-rebuild list-generations | grep current | cut -d " " -f 1)

# Commit all changes witih the generation metadata
git commit -m "generation ${current}"

# Back to where you were
popd

# Notify all OK!
notify-send -e "NixOS Rebuilt OK!" --icon=software-update-available
