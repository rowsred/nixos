# File: starship.nix
# Author: rowsred
# Date: 2026-04-30
# Descriptions:

{ ... }:
{
  flake.homeModules.starship =
    { pkgs, ... }:
    {

      programs.bash = {
        enable = true;
        enableCompletion = true;
        profileExtra = ''
          if [ -d "$HOME/.local/bin" ] ; then
          PATH="$HOME/.local/bin:$PATH"
          fi
        '';
        bashrcExtra = ''
          export HISTSIZE=10000
          alias ls=lsd
        '';
      };
      home.packages = with pkgs; [
        lsd
      ];

      programs.starship = {
        enable = true;
        enableBashIntegration = true; # Default is true
      };
    };
}
