{ pkgs, ... }: {
  services.mihomo = {
    enable = true;
    configFile = ./config-surfing.yaml;
    webui = pkgs.metacubexd;
    tunMode = true;
  };
}
