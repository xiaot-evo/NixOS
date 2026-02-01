{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    # defaultEditor = true;
    extraPackages = with pkgs; [
      nixd
      nixfmt
      # go
      gopls
      delve
    ];
  };
}
