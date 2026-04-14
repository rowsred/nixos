# File: desktop-group.nix
# Author: rowsred
# Date: 2026-04-14
# Description: just for hoby

{ config, ... }:
{
  flake.modules.nixos.desktop-group = {
    imports = [
      config.flake.modules.nixos.display-manager
      config.flake.modules.nixos.wayland-group
      config.flake.modules.nixos.apps-group
    ];
  };

}
