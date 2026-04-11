# File: nix-settings.nix
# Author: rowsred
# Date: 2026-04-11
# Description: just for hoby
{ ... }:
{
  flake.modules.nixos.nix-settings =
    { ... }:
    {
      nix.settings.trusted-users = [
        "root"
        "row"
      ];
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
}
