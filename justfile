default :
    @just --list
flake := "."
current_user := `whoami`
nh := "nix run nixpkgs#nh --"
db := "nix run github:nix-community/home-manager"

# Ganti dengan username Anda
linux_me := "row" 

home:
    @if [ "{{current_user}}" = "{{linux_me}}" ]; then \
        {{nh}} home switch . -c {{linux_me}}; \
    else \
        echo "❌ Bukan user Linux!"; \
        exit 1; \
    fi

homedb:
    @if [ "{{current_user}}" = "{{linux_me}}" ]; then \
        {{db}} -- switch --flake .#{{linux_me}} --verbose; \
    else \
        echo "❌ Bukan user Linux!"; \
        exit 1; \
    fi

homerm:
    @if [ "{{current_user}}" = "{{linux_me}}" ]; then \
        {{db}} -- uninstall; \
    else \
        echo "❌ Bukan user Linux!"; \
        exit 1; \
    fi

