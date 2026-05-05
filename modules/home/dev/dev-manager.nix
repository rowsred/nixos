# File: dev-manager.nix
# Author: rowsred
# Date: 2026-05-05
# Descriptions:
{ config, ... }:
{

  flake.homeModules.dev-manager = {
    imports = [

      config.flake.homeModules.git
    ];
  };

}
