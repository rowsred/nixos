# File: home-root.nix
# Author: rowsred
# Date: 2026-04-14
# Description: just for hoby

{ config, ... }:
{
  flake.modules.homeManager.home-root = {
    imports = [
      config.flake.modules.homeManager.dev-group
      config.flake.modules.homeManager.dotfiles-manager
      config.flake.modules.homeManager.code-editor-group
    ];
  };
}
