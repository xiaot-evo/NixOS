{ pkgs, lib, ... }:
{
  programs.vscode.profiles.default = {
    userSettings = {
      "workbench.colorTheme" = lib.mkForce "GitHub Light";
      "workbench.iconTheme" = "vscode-icons";
      "terminal.integrated.defaultProfile.linux" = "fish";
      "terminal.integrated.profiles.linux" = {
        fish = {
          path = "${pkgs.fish}/bin/fish";
        };
      };
      ## NIX IDE
      # Enable Nix language server via nixd
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
      "nix.serverSettings" = {
        "nixd" = {
          "formatting" = {
            "command" = [ "nixfmt" ];
          };
          "options" = {
            "nixos" = {
              "expr" = "(builtins.getFlake \"/absolute/path/to/flake\").nixosConfigurations.<name>.options";
            };
            "home-manager" = {
              "expr" = "(builtins.getFlake \"/absolute/path/to/flake\").homeConfigurations.<name>.options";
            };
            "nix-darwin" = {
              "expr" = "(builtins.getFlake \"/absolute/path/to/flake\").darwinConfigurations.<name>.options";
            };
          };
        };
      };
      ## VSCodeVim
      "vim.easymotion" = true;
      "vim.incsearch" = true;
      "vim.useSystemClipboard" = true;
      "vim.useCtrlKeys" = true;
      "vim.hlsearch" = true;

      "vim.insertModeKeyBindings" = [
        {
          before = [
            "j"
            "j"
          ];
          after = [ "<Esc>" ];
        }
      ];

      "vim.normalModeKeyBindingsNonRecursive" = [
        {
          before = [
            "<leader>"
            "w"
          ];
          commands = [ ":w" ];
        }
        {
          before = [
            "<leader>"
            "q"
          ];
          commands = [ ":q" ];
        }
        {
          before = [
            "<leader>"
            "d"
          ];
          after = [
            "d"
            "d"
          ];
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
  };
}
