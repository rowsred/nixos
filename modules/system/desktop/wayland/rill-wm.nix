# File: rill-wm.nix
# Author: rowsred
# Date: 2026-04-14
# Description: just for hoby

{ inputs, ... }:
{
  flake.modules.nixos.rill =
    { ... }:
    {
      imports = [
        inputs.rill.nixosModules.default
      ];
    };
}
