# File: git-settings.nix
# Author: rowsred
# Date: 2026-04-09
# Description: just for hoby
{ ... }:
{
  flake.modules.homeManager.git-settings = {
    programs.git = {

      enable = true;
      settings = {
        user = {
          name = "rowsred";
          email = "fadlidev99@gmail.com";
        };
      };
    };
  };
}
