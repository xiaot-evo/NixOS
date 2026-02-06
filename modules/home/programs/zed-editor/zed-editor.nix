{ pkgs, lib, ... }:
{
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;
    extraPackages = with pkgs; [
      nixd
      nixfmt
      package-version-server
      yaml-language-server
    ];
    extensions = [
      "html"
      "nix"
      "git-firefly"
      "toml"
      "catppuccin"
      "catppuccin-icons"
    ];
    userSettings =
      (import ./settings.nix { inherit pkgs lib; }) // (import ./languages.nix { inherit pkgs; });
    userKeymaps = import ./keymap.nix;
  };
}
