# File: flake.nix
# Author: rowsred
# Date: 2026-04-08
# Description: just for hoby

{
  description = "Description for the project";
  nixConfig = {
    trusted-substituters = [
      "https://nix-community.cachix.org"
      "https://noctalia.cachix.org"
      "https://cache.nixos.org"
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    xlibre-overlay.url = "git+https://codeberg.org/takagemacoed/xlibre-overlay";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    rill.url = "github:rowsred/rill_river_modules_nixos";
    kwm.url = "github:rowsred/river_kwm_modules_nixos";
    import-tree.url = "github:vic/import-tree";
    home-manager.url = "github:nix-community/home-manager";
    niri.url = "github:sodiboo/niri-flake";
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);

}
