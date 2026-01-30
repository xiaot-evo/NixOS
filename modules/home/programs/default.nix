{ pkgs, ... }:
{
  imports = [
    ./nh.nix
    ./stylix
    ./helix
    ./vscode
    ./ghostty.nix
    ./zen-browser.nix
    # ./zed-editor.nix
    ./fish.nix
    ./starship.nix
    ./distrobox.nix

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
    spotify
    hmcl
    qq
    wechat
    telegram-desktop
    readest
    wpsoffice-cn
    obs-studio
  ];
}
