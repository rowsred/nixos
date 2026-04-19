# File: dotfiles-manager.nix
# Author: rowsred
# Date: 2026-04-19
# Description:
{ inputs, ... }:
{
  flake.modules.homeManager.dotfiles-manager = {
    xdg.configFile."nvim/init.lua".source = "${inputs.self}/src/config/nvim/init.lua";
    xdg.configFile."rill/config.zon".source = "${inputs.self}/src/config/rill/config.zon";
    xdg.configFile."kitty/kitty.conf".source = "${inputs.self}/src/config/kitty/kitty.conf";
  };
}
