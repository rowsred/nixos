# File: shell-settings.nix
# Author: rowsred
# Date: 2026-04-11
# Description: just for hoby
{ ... }:
{
  flake.modules.homeManager.shell-settings =
    { pkgs, ... }:
    {
      programs.starship = {
        enable = true;
        enableBashIntegration = true;
      };

      home.sessionVariables = {
        LANG = "en_US.UTF-8";
        LC_ALL = "en_US.UTF-8";
      };

      home.packages = [
        pkgs.fastfetch

      ];

      programs.bash = {
        enable = true;
        sessionVariables = {
          PATH = "$HOME/.local/bin:$HOME/.cargo/bin:$PATH";
        };

        shellAliases = {
          ls = "ls --color=auto";
          phost = "podman run -it --name cleanhost --hostname pod -v $HOME/nixos_conf/podman/bashrc-podman.bash:/root/.bashrc -v $(pwd):/work -w /work -v $HOME/.config/nvim:/root/.config/nvim -v $HOME/.local/share/nvim:/root/.local/share/nvim --rm docker.io/nixos/nix
          ";
          zellij = "bash <(curl -L https://zellij.dev/launch)";
        };

        initExtra = ''
          fastfetch
        '';
      };
    };
}
