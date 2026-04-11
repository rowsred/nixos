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
  home-mods = self.modules.homeManager;
  nixos-mods = config.flake.modules.nixos;

in
{
  flake.nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {

    specialArgs = { inherit inputs; };
    modules = [
      nixos-mods.hardware-h61
      nixos-mods.boot
      nixos-mods.users
      nixos-mods.nix-settings
      nixos-mods.system-apps
      nixos-mods.state-version
      nixos-mods.network
      nixos-mods.window-manager
      nixos-mods.display-manager
      nixos-mods.apps-launcher
      nixos-mods.default-browser
      {
        nixpkgs.hostPlatform = "x86_64-linux";
      }
    ];
  };

  configurations.home.row.module = {
    imports = [

      home-mods.Shell
      home-mods.Nvim
      home-mods.Git
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
