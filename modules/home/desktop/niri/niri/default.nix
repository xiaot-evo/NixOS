{ pkgs, inputs, ... }:
{
  imports = [
    ./settings.nix
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };
}
