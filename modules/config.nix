# File: default.nix
# Author: rowsred
# Date: 2026-04-08
# Description: just for hoby

{ self, inputs, ... }:
{
  flake.nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {

    specialArgs = { inherit inputs; };
    modules = [
      self.nixosModules.nixos
      self.nixosModules.ly
      self.nixosModules.rill
      self.nixosModules.apps
      self.nixosModules.nvim
      {
        nixpkgs.hostPlatform = "x86_64-linux";
      }
    ];

  };
}
