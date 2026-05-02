# File: vscode.nix
# Author: rowsred
# Date: 2026-05-02
# Descriptions:
{ ... }:
{
  flake.homeModules.vscode =
    { pkgs, ... }:
    {
      programs.vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
          vscodevim.vim # The essential Vim plugin
          # Add other plugins here, e.g., dracula-theme.theme-dracula
        ];

        userSettings = {
          # 1. Define the Leader Key (Space is standard)
          "vim.leader" = "<space>";
          "vim.insertModeKeyBindings" = [
            {
              "before" = [
                "j"
                "k"
              ];
              "after" = [ "<Esc>" ];
            }
          ];

          # 2. Basic Leader Key Bindings
          "vim.normalModeKeyBindingsNonRecursive" = [

            # ... your existing mappings (w, f, e, Ctrl+v) ...

            # 1. Leader c to Close File (Tab)
            {
              "before" = [
                "leader"
                "c"
              ];
              "commands" = [ "workbench.action.closeActiveEditor" ];
            }

            # 2. Leader x to Previous Buffer (Left Tab)
            {
              "before" = [
                "leader"
                "x"
              ];
              "commands" = [ "workbench.action.previousEditor" ];
            }

            # Optional: Leader l to Next Buffer (Right Tab) for symmetry
            {
              "before" = [
                "leader"
                "l"
              ];
              "commands" = [ "workbench.action.nextEditor" ];
            }
            {
              "before" = [
                "leader"
                "e"
              ];
              "commands" = [ "workbench.view.explorer" ];
            }
            {
              "before" = [
                "leader"
                "w"
              ];
              "commands" = [ "workbench.action.files.save" ];
            }
            {
              "before" = [
                "leader"
                "f"
              ];
              "commands" = [ "workbench.action.quickOpen" ];
            }
          ];
          # --- 1. TOTAL UI PURGE (Hanya Status Bar) ---
          "window.titleBarStyle" = "custom";
          "window.menuBarVisibility" = "hidden";
          "workbench.activityBar.location" = "hidden";
          "workbench.statusBar.visible" = true;
          "workbench.sideBar.location" = "left";
          "editor.minimap.enabled" = false;
          "editor.scrollbar.vertical" = "hidden";
          "editor.scrollbar.horizontal" = "hidden";
          "editor.guides.bracketPairs" = "active";
          "editor.guides.indentation" = false;
          "workbench.layoutControl.enabled" = false;
          "window.commandCenter" = false;
          "workbench.tips.enabled" = false;

          # --- 2. FORCE DARK & NO BORDERS (Hapus sisa garis putih) ---
          "workbench.colorCustomizations" = {
            "window.border" = "#0d1117";
            "titleBar.activeBackground" = "#0d1117";
            "titleBar.inactiveBackground" = "#0d1117";
            "titleBar.border" = "#0d1117";
            "sideBar.background" = "#0d1117";
            "sideBar.border" = "#0d1117";
            "activityBar.border" = "#0d1117";
            "editorGroup.border" = "#0d1117";
            "editorGroupHeader.tabsBackground" = "#0d1117";
            "tab.border" = "#0d1117";
            "tab.activeBorder" = "#0d1117";
            "statusBar.background" = "#0d1117";
            "statusBar.border" = "#0d1117";
            "editor.background" = "#0d1117";
          };

          # --- 3. KILL ALL AI AGENTS & BLOAT ---
          "github.copilot.enable" = {
            "*" = false;
          };
          "github.copilot.editor.enableChat" = false;
          "github.copilot.editor.enableAutoCompletions" = false;
          "github.copilot.chat.enableCodeAction" = false;
          "github.copilot.chat.welcomeMessage" = "never";
          "intellicode.completionsEnabled" = false;
          "editor.inlineSuggest.enabled" = false;
          "scm.showActionButton" = false;
          "chat.editing.alwaysConfirmWithAgent" = "never";
          "editor.ai.enabled" = false;

          # --- CLEAN SCROLLBAR ---

          # ... sisa pengaturan Vim & AI tetap di sini ...

          # --- SMART HIGHLIGHTING ---
          "editor.semanticHighlighting.enabled" = true;
          "editor.bracketPairColorization.enabled" = true;
          "editor.guides.bracketPairsHorizontal" = false;

          # --- FONT (SF MONO) ---
          "editor.fontFamily" = "'SFMono Nerd Font', 'monospace'";
          "editor.fontLigatures" = true;
          "editor.fontSize" = 12;
          "editor.lineHeight" = 20; # Tambah jarak baris agar tidak sesak

          # --- VIM & PERFORMANCE ---
          "vim.useSystemClipboard" = true;
          "vim.hlsearch" = true;
          "editor.formatOnSave" = true;

        };
      };

    };
}
