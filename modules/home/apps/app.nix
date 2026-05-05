# File: dev.nix
# Author: rowsred
# Date: 2026-05-05
# Descriptions:

{ ... }:
{
  flake.homeModules.app =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        tree
        just
        unzip
      ];
    };
}
