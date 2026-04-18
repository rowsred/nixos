# File: bashrc-podman.bash
# Author: rowsred
# Date: 2026-04-16
# Description: just for hoby
PS1="\u@\h:\w# "
alias nix="nix --experimental-features 'nix-command flakes'"
alias nvim="nix run github:nix-community/neovim-nightly-overlay"

