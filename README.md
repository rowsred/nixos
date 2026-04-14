# ❄️ NixOS Configuration: Rowsred

A minimal and organized NixOS setup using **flake-parts** and the **Dendritic Pattern**.

## 📂 Structure
```
tree modules/
modules/
├── home
│   ├── git-settings.nix
│   ├── neovim.nix
│   └── shell-settings.nix
├── nixos
│   ├── nixos-options.nix
│   └── nixos-root.nix
└── system
    ├── core
    │   ├── boot.nix
    │   ├── core-group.nix
    │   ├── hardware.nix
    │   ├── nix
    │   │   ├── features-flake.nix
    │   │   ├── nix-group.nix
    │   │   └── trusted-users.nix
    │   ├── state-version.nix
    │   └── users.nix
    ├── desktop
    │   ├── apps
    │   │   ├── apps-group.nix
    │   │   ├── browser
    │   │   │   ├── browser-group.nix
    │   │   │   └── google-chrome.nix
    │   │   └── system-apps.nix
    │   ├── desktop-group.nix
    │   ├── display-manager.nix
    │   └── wayland
    │       ├── app-launcher.nix
    │       ├── rill-wm.nix
    │       ├── shell
    │       └── wayland-group.nix
    ├── services
    │   ├── network.nix
    │   └── services-group.nix
    └── system-root.nix

12 directories, 25 files
```
