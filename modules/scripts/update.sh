#!/usr/bin/env bash

set -euo pipefail

HOST="${1:-vecna}"

cd ~/nixosconf

echo ">>> updating flake inputs"
nix flake update

echo ">>> rebuilding system $HOST"
sudo nixos-rebuild switch --flake ~/nixosconf/#$HOST

echo "configuration updated successfully"