# File: podman.nix
# Author: rowsred
# Date: 2026-04-16
# Description: just for hoby
{ ... }:
{
  flake.modules.nixos.podman =
    { pkgs, ... }:
    {
      virtualisation = {
        containers.enable = true;
        podman = {
          enable = true;
          dockerCompat = true;
          defaultNetwork.settings.dns_enabled = true; # Required for containers under podman-compose to be able to talk to each other.
        };
      };
      environment.systemPackages = with pkgs; [
        distrobox
      ];
    };
}
