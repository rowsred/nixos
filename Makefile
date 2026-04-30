
def:

os:
	nix run nixpkgs#nh os switch .
test:
	sudo nixos-rebuild test --flake .
home:
	nix run nixpkgs#nh home switch . -v 
homedb:
	nix run github:nix-community/home-manager -- switch --flake .

unhome:
	nix run home-manager/master -- uninstall

