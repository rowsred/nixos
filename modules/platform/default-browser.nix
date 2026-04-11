# File: default-browser.nix
# Author: rowsred
# Date: 2026-04-11
# Description: just for hoby
{ ... }:
{
  flake.modules.nixos.default-browser =
    { pkgs, inputs, ... }:
    let
      unstable = import inputs.nixpkgs-unstable {
        system = pkgs.stdenv.hostPlatform.system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      environment.systemPackages = [
        unstable.google-chrome
      ];
    };
}
