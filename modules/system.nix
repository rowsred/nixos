# File: system.nix
# Author: rowsred
# Date: 2026-04-10
# Description: just for hoby
{ inputs, ... }:
{
  imports = [
    inputs.flake-parts.flakeModules.modules
    inputs.home-manager.flakeModules.home-manager
  ];
  flake.modules.nixos.nix-settings =
    { inputs, ... }:
    {
      nix.settings.trusted-users = [
        "root"
        "row"
      ];
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
    };

  flake.modules.nixos.hardware-h61 =

    {
      config,
      lib,
      pkgs,
      modulesPath,
      ...
    }:

    {
      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
      ];

      boot.initrd.availableKernelModules = [
        "ehci_pci"
        "ahci"
        "nvme"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [ "kvm-intel" ];
      boot.extraModulePackages = [ ];

      fileSystems."/" = {
        device = "/dev/disk/by-uuid/91f618d6-c7f3-491a-9b28-1f92497cc943";
        fsType = "ext4";
      };

      fileSystems."/boot/efi" = {
        device = "/dev/disk/by-uuid/445E-7BE6";
        fsType = "vfat";
        options = [
          "fmask=0022"
          "dmask=0022"
        ];
      };

      swapDevices = [ ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };

  flake.modules.nixos.boot =
    { pkgs, ... }:
    {

      boot.kernelParams = [ "video=1366x768@60" ];
      boot.loader.grub.enable = true;
      boot.loader.grub.efiSupport = true;
      boot.loader.efi.efiSysMountPoint = "/boot/efi";
      boot.loader.grub.device = "nodev"; # or "nodev" for efi only
      boot.kernelPackages = pkgs.linuxPackages_latest;

    };

  flake.modules.nixos.users =
    { ... }:
    {
      users.users.row = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "adbusers"
          "kvm"
        ]; # Enable ‘sudo’ for the user.
      };
    };

  flake.modules.nixos.network =
    { ... }:
    {
      networking.networkmanager.enable = true;
    };

  flake.modules.nixos.state-version =
    { ... }:
    {
      system.stateVersion = "25.11"; # Did you read the comment?
    };

  flake.modules.nixos.system-apps =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        git
        vim
        gnumake
        kitty
      ];
    };

  flake.modules.nixos.window-manager =
    { inputs, ... }:
    {
      imports = [
        inputs.rill.nixosModules.default
      ];
    };

  flake.modules.nixos.display-manager =
    { inputs, ... }:
    {
      services.displayManager.ly.enable = true;
    };

  flake.modules.nixos.apps-launcher =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        fuzzel
      ];
    };

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
