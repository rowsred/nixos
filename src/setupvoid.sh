#!/bin/sh

# Colors
G=$(printf '\033[0;32m')
R=$(printf '\033[0;31m')
B=$(printf '\033[0;34m')
N=$(printf '\033[0m')
FILE_PATH="/etc/profile.d/xdg_runtime.sh"

printf "\n${B}[*] Setuping repo freedif...${N}\n"
sudo tee /etc/xbps.d/00-repository-main.conf << 'EOF'
repository=https://mirror.freedif.org/voidlinux/current
EOF
sudo xbps-install -Syy 
    sleep 1

if [ ! -L "/var/service/seatd" ]; then
    printf "\n${B}[*] Setting up XDG Runtime in system...${N}\n"
    # Create the profile script
    sudo tee "$FILE_PATH" > /dev/null << 'EOF'
#!/bin/sh
if [ -z "$XDG_RUNTIME_DIR" ]; then
    export XDG_RUNTIME_DIR="/tmp/run/user/$(id -u)"
    if [ ! -d "$XDG_RUNTIME_DIR" ]; then
        mkdir -p "$XDG_RUNTIME_DIR"
        chmod 700 "$XDG_RUNTIME_DIR"
    fi
fi
EOF
    sudo chmod +x "$FILE_PATH"
    printf "${G}[SUCCESS] File $FILE_PATH has been created.${N}\n"
else
    printf "\n${B}[*] XDG Runtime script is ready in system...${N}\n"
fi

    sleep 1
printf "\n${B}[*] Setuping dbus-louch ...${N}\n"
[ -f /etc/profile.d/dbus-session.sh ] || sudo tee /etc/profile.d/dbus-session.sh << 'EOF'
# Start a D-Bus session bus if one isn't already running
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval $(dbus-launch --sh-syntax --exit-with-session)
fi
EOF

    sleep 1
printf "\n${B}[*] Installing seatd...${N}\n"
sudo xbps-install -Sy seatd dbus niri mesa-dri sddm xorg 

printf "\n${B}[*] Enabling seatd service...${N}\n"
if [ ! -L "/var/service/seatd" ]; then
    sudo ln -s /etc/sv/seatd /var/service/
    printf "${G}[SUCCESS] seatd service enabled.${N}\n"
else
    printf "${B}[!] seatd service already enabled.${N}\n"
fi
    sleep 1

printf "\n${B}[*] Enabling dbus service...${N}\n"
if [ ! -L "/var/service/dbus" ]; then
    sudo ln -s /etc/sv/dbus /var/service/
    printf "${G}[SUCCESS] dbus service enabled.${N}\n"
else
    printf "${B}[!] dbus service already enabled.${N}\n"
fi
    sleep 1

printf "\n${B}[*] Enabling sddm service...${N}\n"
if [ ! -L "/var/service/sddm" ]; then
    sudo ln -s /etc/sv/sddm /var/service/
    printf "${G}[SUCCESS] sddm service enabled.${N}\n"
else
    printf "${B}[!] sddm service already enabled.${N}\n"
fi
    sleep 1

printf "\n${B}[*] Setuping user groups...${N}\n"
for group in audio video _seatd input; do
    if ! id -nG "$(whoami)" | grep -qw "$group"; then
        sudo usermod -aG "$group" $(whoami)
        printf "${G}[SUCCESS] User added to $group group.${N}\n"
    else
        printf "${G}[SUCCESS] User already on $group group.${N}\n"
    fi
done
    sleep 1
printf "\n${B}[*] Preparing font directory...${N}\n"

# 1. Pastikan direktori fonts utama user ada
if [ ! -d "$HOME/.local/share/fonts" ]; then
    mkdir -p "$HOME/.local/share/fonts"
    printf "${G}[+] Created $HOME/.local/share/fonts${N}\n"
fi

# 2. Tentukan lokasi spesifik untuk SF Mono
FONT_TARGET="$HOME/.local/share/fonts/SF-Mono-Nerd"

# 3. Cek jika direktori tujuan sudah ada
if [ -d "$FONT_TARGET" ]; then
    printf "${B}[!] Directory $FONT_TARGET already exists. Removing old version...${N}\n"
    rm -rf "$FONT_TARGET"
fi

# 4. Clone repository
printf "${B}[*] Cloning SF Mono Nerd Font from GitHub...${N}\n"
if git clone --depth 1 https://github.com/epk/SF-Mono-Nerd-Font.git "$FONT_TARGET"; then
    # Hapus folder .git agar tidak membebani sistem
    rm -rf "$FONT_TARGET/.git"
    
    printf "${B}[*] Updating font cache...${N}\n"
    fc-cache -fv > /dev/null
    printf "${G}[SUCCESS] Font installed to $FONT_TARGET${N}\n"
else
    printf "${R}[ERROR] Failed to clone font repository. Check your internet connection.${N}\n"
fi
    sleep 1
printf "\n${G}Done! Please log out and back in for changes to take effect.${N}\n"
