{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;
    extraPackages = with pkgs; [
      nixd
      nixfmt
    ];
    extensions = [ "nix" ];
    userSettings = {
      # features = {
      #   copilot = false;
      # };
      # telemetry = {
      #   metrics = false;
      # };
      # vim_mode = false;
      # ui_font_size = 16;
      # buffer_font_size = 16;
      helix_mode = true;
    };
  };
}
