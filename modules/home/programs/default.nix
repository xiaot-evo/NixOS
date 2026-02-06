{ pkgs, ... }:
{
  imports = [
    ./nh.nix
    ./helix
    ./ghostty.nix
    ./zed-editor
    ./zen-browser.nix
    ./fish.nix
    ./starship.nix
    ./direnv.nix

    ## AI
    ./opencode.nix
  ];
  home.packages = with pkgs; [
    ## cmd
    fastfetch
    devenv
    yazi
    android-tools

    ## gui
    bilibili
    resources
    splayer
    # hmcl
    prismlauncher
    qq
    wechat
    telegram-desktop
    readest
    wpsoffice-cn
    obs-studio
  ];
}
