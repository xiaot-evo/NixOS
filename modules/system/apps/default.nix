{ pkgs, ... }:
{
  imports = [
    ./nbfc-linux.nix
    ./daed.nix
    # ./steam.nix
    # ./nushell.nix
    # ./gamemode.nix
    # ./localsend.nix
    # ./virt-manager.nix
    # ./virtualbox.nix
  ];
  environment.defaultPackages = with pkgs; [
    vim
    wget
    tree
    git
  ];
}
