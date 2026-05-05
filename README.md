# ❄️ NixOS Configuration: Rowsred

A minimal and organized NixOS setup using **flake-parts** and the **Dendritic Pattern**.
## 📂 Structure

## 📂Home () 
```
❯ tree modules/home/
modules/home/
├── apps
│   ├── app.nix
│   └── apps-manager.nix
├── dev
│   ├── dev-manager.nix
│   └── git.nix
├── editors
│   ├── editors-manager.nix
│   ├── neovim.nix
│   └── vscode.nix
└── home-manager.nix

4 directories, 8 files
```
Command:
```
just home
```
