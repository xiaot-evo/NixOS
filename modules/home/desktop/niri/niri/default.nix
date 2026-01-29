{ pkgs, inputs, ... }:
{
  imports = [
    ./niri-settings.nix
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };
}
