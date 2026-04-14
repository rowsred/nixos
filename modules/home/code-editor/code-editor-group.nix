# File: code-editor-group.nix
# Author: rowsred
# Date: 2026-04-14
# Description: just for hoby

{ config, ... }:
{
  flake.modules.homeManager.code-editor-group = {
    imports = [
      config.flake.modules.homeManager.neovim
    ];
  };
}
