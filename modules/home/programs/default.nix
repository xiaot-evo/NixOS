{ pkgs, ... }:
{
  imports = [
    ./nh.nix
    ./stylix
    # ./nushell.nix
    ./helix
    ./vscode.nix
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
    # prismlauncher
    hmcl
    # qq
    (pkgs.qq.override {
      commandLineArgs = [
        "--ozone-platform-hint=auto"
        "--enable-wayland-ime"
        # "--wayland-text-input-version=3"
      ];
    })
    wechat
    telegram-desktop
    readest
    wpsoffice-cn
  ];
}
