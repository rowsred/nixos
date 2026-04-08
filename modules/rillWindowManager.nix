# File: rillWindowManager.nix
# Author: rowsred
# Date: 2026-04-08
# Description: just for hoby
{ inputs, ... }:
{
  flake.nixosModules.rill = {
    imports = [
      inputs.rill.nixosModules.default
    ];
  };
}
