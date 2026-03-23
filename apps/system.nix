{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ripgrep
    gnumake
    fzf
    tmux
    rsync
    unzip
    wget
    starship
    clang
  ];

}
