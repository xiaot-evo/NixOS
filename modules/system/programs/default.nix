{ pkgs, ... }:
{
  imports = [
    ./daed.nix
    # ./steam.nix
    # ./gamemode.nix
    # ./localsend.nix
    # ./virt-manager.nix
    # ./virtualbox.nix
  ];
  environment.defaultPackages = with pkgs; [
    home-manager
    vim
    wget
    tree
    git
  ];
}
