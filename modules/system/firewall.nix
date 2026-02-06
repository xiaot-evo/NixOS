{
  networking.firewall = {
    enable = false;
    allowedTCPPorts = [
      22
      80
      443
    ];
  };
}
