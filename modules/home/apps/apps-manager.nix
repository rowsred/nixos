# File: apps-manager.nix
# Author: rowsred
# Date: 2026-05-05
# Descriptions:

{ config, ... }:
{
  flake.homeModules.apps-manager = {
    imports = [
      config.flake.homeModules.app
    ];
  };
}
