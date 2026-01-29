{ pkgs, ... }:
{
  imports = [
    ./niri
    ./noctalia-shell
    ./swayidle.nix
    ./fcitx5.nix
  ];
}
