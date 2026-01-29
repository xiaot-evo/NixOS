{
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    clean.dates = "weekly";
    flake = "/home/xiaot_evo/NixOS/"; # sets NH_OS_FLAKE variable for you
  };
}
