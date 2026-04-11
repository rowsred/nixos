# File: default.nix
# Author: rowsred
# Date: 2026-04-08
# Description: just for hoby

{
  self,
  inputs,
  config,
  ...
}:
let
  inherit (config.flake.modules) nixos;
  inherit (config.flake.modules) homeManager;

in
{
  imports = [
    inputs.flake-parts.flakeModules.modules
    inputs.home-manager.flakeModules.home-manager
  ];
  configurations.nixos.nixos.module = {
    imports = [
      nixos.hardware-h61
      nixos.boot
      nixos.users
      nixos.nix-settings
      nixos.system-apps
      nixos.state-version
      nixos.network
      nixos.window-manager
      nixos.display-manager
      nixos.apps-launcher
      nixos.default-browser
      {
        nixpkgs.hostPlatform = "x86_64-linux";
      }
    ];
  };

  configurations.home.row.module = {
    imports = [
      homeManager.shell-settings
      homeManager.neovim
      homeManager.git-settings
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
