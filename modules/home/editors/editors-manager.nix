# File: package-manager.nix
# Author: rowsred
# Date: 2026-05-05
# Descriptions:
{ config, ... }:
{
  flake.homeModules.editors-manager = {
    imports = [
      config.flake.homeModules.neovim
      config.flake.homeModules.vscode
    ];
  };
}
