# File: window-manager.nix
# Author: rowsred
# Date: 2026-04-11
# Description: just for hoby
{ ... }:
{
  flake.modules.nixos.window-manager =
    { inputs, ... }:
    {
      imports = [
        inputs.rill.nixosModules.default
      ];
    };
}
