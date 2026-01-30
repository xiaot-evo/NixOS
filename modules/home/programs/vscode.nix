{ pkgs, lib, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default = {
      userSettings = {
        "workbench.colorTheme" = lib.mkForce "Default Light Modern";

        ## VSCodeVim
        "vim.easymotion" = true;
        "vim.incsearch" = true;
        "vim.useSystemClipboard" = true;
        "vim.useCtrlKeys" = true;
        "vim.hlsearch" = true;

        "vim.insertModeKeyBindings" = [
          {
            before = [ "j" "j" ];
            after = [ "<Esc>" ];
          }
        ];

        "vim.normalModeKeyBindingsNonRecursive" = [
          {
            before = [ "<leader>" "w" ];
            commands = [ ":w" ];
          }
          {
            before = [ "<leader>" "q" ];
            commands = [ ":q" ];
          }
          {
            before = [ "<leader>" "d" ];
            after = [ "d" "d" ];
          }
          {
            before = [ "<C-n>" ];
            commands = [ ":nohl" ];
          }
          {
            before = [ "K" ];
            commands = [ "lineBreakInsert" ];
            silent = true;
          }
        ];

        "vim.leader" = "<space>";
        "vim.handleKeys" = {
          "<C-a>" = false;
          "<C-f>" = false;
        };

        # To improve performance
        "extensions.experimental.affinity" = {
          "vscodevim.vim" = 1;
        };
      };

      extensions = with pkgs.vscode-extensions; [
        ms-ceintl.vscode-language-pack-zh-hans
        github.copilot
        github.copilot-chat
        vscodevim.vim
        jnoortheen.nix-ide
      ];
    };
  };
}
