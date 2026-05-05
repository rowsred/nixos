# File: dev.nix
# Author: rowsred
# Date: 2026-05-05
# Descriptions:

{ ... }:
{
  flake.homeModules.dev =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        tree
        just
        unzip
      ];
    };
}
