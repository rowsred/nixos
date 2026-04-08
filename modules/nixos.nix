# File: nixos.nix
# Author: rowsred
# Date: 2026-04-08
# Description: just for hoby
{ ... }:
{
  flake.nixosModules.nixos =
    {
      pkgs,
      inputs,
      ...
    }:

    {
      nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
      nix.settings.trusted-users = [
        "root"
        "row"
      ];
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      imports = [
        /etc/nixos/hardware-configuration.nix
      ];

      boot.kernelParams = [ "video=1366x768@60" ];
      boot.loader.grub.enable = true;
      boot.loader.grub.efiSupport = true;
      boot.loader.efi.efiSysMountPoint = "/boot/efi";
      boot.loader.grub.device = "nodev"; # or "nodev" for efi only
      boot.kernelPackages = pkgs.linuxPackages_latest;
      networking.networkmanager.enable = true;
      environment.etc."gtk-3.0/settings.ini".text = ''
        [Settings]
        gtk-application-prefer-dark-theme = 1
      '';
      users.users.row = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "adbusers"
          "kvm"
        ]; # Enable ‘sudo’ for the user.
        packages = with pkgs; [
          tree
          git
          vim
        ];
      };
      system.stateVersion = "25.11"; # Did you read the comment?
    };
}
