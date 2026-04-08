# File: apps.nix
# Author: rowsred
# Date: 2026-04-08
# Description: just for hoby

{ inputs, pkgs, ... }:
let
  unstable = import inputs.nixpkgs-unstable {

  };
in
{
  flake.nixosModules.nvim =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        inputs.neovim-nightly-overlay.packages.${pkgs.system}.default
        unstable.rust-analyzer
        unstable.wl-clipboard-rs
        unstable.nil
        pkgs.clippy
        pkgs.rustfmt
        pkgs.nixfmt
        pkgs.slint-lsp
        pkgs.clang-tools
        pkgs.stylua
        pkgs.prettier
        pkgs.lua-language-server
        pkgs.nerd-fonts.symbols-only

      ];
    };

}
