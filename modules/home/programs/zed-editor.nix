{ config, pkgs, ... }:
{
  programs.zed-editor = {
    package = pkgs.zed-editor;
    enable = true;
    extraPackages = with pkgs; [
      nixd
      nixfmt
    ];
    extensions = [
      "nix"
    ];
    userSettings = {
      helix_mode = true;
    };
  };
}
