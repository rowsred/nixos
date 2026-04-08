

def:

os:
	sudo nixos-rebuild switch --flake --impure
test:
	sudo nixos-rebuild test --flake --impure
