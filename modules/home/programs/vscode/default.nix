{ pkgs, ... }:
{
  imports = [ ./settings.nix ];
  # home.packages = with pkgs; [
  #   nixd
  #   nixfmt
  # ];
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhsWithPackages (
      ps: with ps; [
        nixd
        nixfmt
      ]
    );
    mutableExtensionsDir = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      ## apperance
      # theme
      # icons
      vscode-icons-team.vscode-icons

      ## tools
      # i18n
      ms-ceintl.vscode-language-pack-zh-hans
      # project
      alefragnani.project-manager
      gruntfuggly.todo-tree
      # edit
      christian-kohler.path-intellisense
      oderwat.indent-rainbow
      vscodevim.vim
      # environment
      mkhl.direnv
      # ai
      # github.copilot-chat
      # github.copilot

      ## language support
      # nix
      jnoortheen.nix-ide
      # golang
      golang.go
      # javascript/typescript
      # oven.bun-vscode
    ];
  };
}
