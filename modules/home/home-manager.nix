# File: home-manager.nix
# Author: rowsred
# Date: 2026-05-05
# Descriptions:
{ config, inputs, ... }:
{
  imports = [
    inputs.home-manager.flakeModules.home-manager
  ];
  configurations.home.row.module = {
    imports = [
      config.flake.homeModules.editors-manager
      config.flake.homeModules.dev-manager
      config.flake.homeModules.apps-manager
      inputs.kwm.homeModules.default
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
