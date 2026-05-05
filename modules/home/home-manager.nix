# File: home-manager.nix
# Author: rowsred
# Date: 2026-05-05
# Descriptions:
{ config, ... }:
{
  configurations.home.row.module = {
    imports = [
      config.flake.homeModules.editors-manager
      config.flake.homeModules.dev-manager
      config.flake.homeModules.apps-manager
      {
        home = {
          username = "row";
          homeDirectory = "/home/row";
          stateVersion = "25.11";
        };
      }
    ];
  };

}
