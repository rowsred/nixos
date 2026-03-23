{
  description = "Description for the project";
  nixConfig = {
    trusted-substituters = [
      "https://nix-community.cachix.org"
      "https://cache.nixos.org"
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    my_dwm.url = "github:rowsred/my_dwm/main";
    my_dwm.flake = false;

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    xlibre-overlay.url = "git+https://codeberg.org/takagemacoed/xlibre-overlay";

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
      inputs.noctalia-qs.follows = "noctalia-qs";
    };

    noctalia-qs = {
      url = "github:noctalia-dev/noctalia-qs";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs =
    { self, ... }@inputs:
    {
      nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/pc_h61
          #          ./desktop/niri_noctalia.nix
          ./desktop/xlibre_dwm.nix
          ./apps/system.nix
          ./apps/neovim-nightly.nix
        ];
      };
    };
}
