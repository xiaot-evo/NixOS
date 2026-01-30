{ pkgs, lib, ... }:
{
  imports = [ ./settings.nix ];
  home.packages = with pkgs; [
    nixd
    nixfmt
  ];
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      ms-ceintl.vscode-language-pack-zh-hans
      github.copilot
      github.copilot-chat
      vscodevim.vim
      jnoortheen.nix-ide
      christian-kohler.path-intellisense
      vscode-icons-team.vscode-icons
    ];
  };
}
