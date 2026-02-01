{ pkgs, ... }:
{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/cattppuccin-frappe.yaml";
    # image = pkgs.fetchurl {
    #   url = "https://b.zhutix.com/bizhi/follow_me/03.jpg";
    #   sha256 =
    #     "b09a9ed237e5e51af72d92c6f7b1d4f9f90b73628568b5240fc7220c61b9ec9d";
    #};
    image = ./wallpapers/5.png;
    polarity = "dark";
    opacity = {
      desktop = 0.8;
      terminal = 0.95;
      popups = 0.8;
      applications = 1.0;
    };
    cursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
    fonts = {
      serif = {
        package = pkgs.noto-fonts-cjk-sans;
        name = "Noto Sans CJK SC Medium";
      };
      sansSerif = {
        package = pkgs.lxgw-wenkai;
        name = "霞鹜文楷 Medium";
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
    icons = {
      enable = true;
      light = "Tela-light";
      dark = "Tela-dark";
      package = pkgs.tela-icon-theme;
    };
  };
}
