# File: niri-wm.nix
# Author: rowsred
# Date: 2026-04-22
# Descriptions:
{ inputs, ... }:
{
  flake.modules.nixos.niri =
    { pkgs, ... }:
    {
      nixpkgs.overlays = [ inputs.niri.overlays.niri ];
      programs.niri = {
        enable = true;
        package = pkgs.niri-unstable;
      };
    };

}
