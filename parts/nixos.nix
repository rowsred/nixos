{ inputs, ... }:

{
  flake = {
    nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ../hosts/pc_h61
        #./desktop/niri_noctalia.nix
        ../desktop/xlibre_dwm.nix
        ../apps/system.nix
        ../apps/neovim-nightly.nix
      ];
    };
  };
}
