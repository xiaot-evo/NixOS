{ pkgs, lib, ... }:
{
  imports = [ ./settings.nix ];
  #TODO 独立vscode环境
  # home.packages = with pkgs; [
  #   nixd
  #   nixfmt
  # ];
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      ms-ceintl.vscode-language-pack-zh-hans
      github.copilot
      github.copilot-chat
      vscodevim.vim
      jnoortheen.nix-ide
      mkhl.direnv
      christian-kohler.path-intellisense
      vscode-icons-team.vscode-icons
      gruntfuggly.todo-tree
      oderwat.indent-rainbow
      github.github-vscode-theme
    ];
  };
}
