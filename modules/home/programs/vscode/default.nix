{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    nixd
    nixfmt
  ];
  programs.vscode = {
    enable = true;
     extensions = with pkgs.vscode-extensions; [
        ms-ceintl.vscode-language-pack-zh-hans
        github.copilot
        github.copilot-chat
        vscodevim.vim
        jnoortheen.nix-ide
        christian-kohler.path-intellisense
      ];
    };
  };
}
