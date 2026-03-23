{ inputs, pkgs, ... }:
{
  imports = [
    inputs.xlibre-overlay.nixosModules.overlay-xlibre-xserver
    inputs.xlibre-overlay.nixosModules.overlay-xlibre-xf86-input-libinput
  ];

  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    kitty
    firefox
    xclip
    rofi
  ];
  services.xserver.windowManager.dwm = {
    enable = true;
    package = pkgs.dwm.overrideAttrs {
      src = inputs.my_dwm;
      sourceRoot = "source/dwm";
      nativeBuildInputs = [
        pkgs.pkg-config
        pkgs.gcc
        pkgs.gnumake
      ];

      # 3. Define the exact libraries needed to link it
      # These fix the "Could not start dynamically linked executable" error
      buildInputs = [
        pkgs.xorg.libX11
        pkgs.xorg.libXft
        pkgs.xorg.libXinerama
        pkgs.fontconfig
      ];
      makeFlags = [
        "PREFIX=$(out)"
        "CC:=gcc"
      ];

      # This ensures that even if config.mk is stubborn,
      # Nix will find the libraries via pkg-config.
      preConfigure = ''
        sed -i 's/LDFLAGS  = /LDFLAGS += /g' config.mk
        sed -i 's/CPPFLAGS = /CPPFLAGS += /g' config.mk
      '';
      postInstall = ''
        mkdir -p $out/share/xsessions
        # Adjust the path below if dwm.desktop is in a different subfolder
        cp ../dwm.desktop $out/share/xsessions/
      '';
    };

  };

  services.xserver.enable = true;
  services.displayManager.ly.enable = true;
}
