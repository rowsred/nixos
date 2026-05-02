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
          github.github-vscode-theme
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
            {
              "before" = [ "<C-v>" ];
              "commands" = [ "workbench.action.focusFirstEditorGroup" ];
            }
          ];
          # --- REMOVE AI FEATURES ---
          "github.copilot.enable" = {
            "*" = false;
          }; # Kill Copilot if installed
          # --- macOS Look & Font ---
          "workbench.colorTheme" = "GitHub Dark";
          "editor.lineHeight" = 22;
          "window.titleBarStyle" = "native";
          "workbench.activityBar.location" = "hidden";
          "editor.minimap.enabled" = false;
          "editor.cursorBlinking" = "smooth";

          # --- Smart Highlighting ---
          "editor.semanticHighlighting.enabled" = true;
          "editor.bracketPairColorization.enabled" = true;
          "editor.guides.bracketPairs" = "active";

          "editor.fontFamily" = "'SFMono Nerd Font', 'monospace'";
          "editor.fontLigatures" = true;
          "editor.formatOnSave" = true;
          "editor.fontSize" = 12;
          "editor.inlineSuggest.enabled" = false; # Kill AI ghost text
          "editor.suggest.showMethods" = true; # Keep standard local suggestions
          "editor.suggest.showSnippets" = true;
          "intellicode.completionsEnabled" = false; # Kill MS IntelliCode AI
          "workbench.layoutControl.enabled" = false; # Cleans up UI buttons
          "editor.guides.bracketPairsHorizontal" = false;

          "github.copilot.chat.enableCodeAction" = false;
          "github.copilot.editor.enableChat" = false;
          "github.copilot.editor.enableAutoCompletions" = false;
          "scm.showActionButton" = false;
          "github.copilot.chat.generateChatParticipantInference" = false;
          "workbench.panel.opensMaximized" = "never";
          "github.copilot.chat.welcomeMessage" = "never";
          "window.commandCenter" = false;
          "vim.handleKeys" = {
            "<C-v>" = true;
          };
          # 3. Recommended Vim settings
          "vim.useSystemClipboard" = true;
          "vim.hlsearch" = true;
        };
      };

    };

}
