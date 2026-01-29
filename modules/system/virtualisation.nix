{
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
  # virtualisation.libvirtd = {
  #   enable = true;
  #   allowedBridges = [ ];
  #   qemu.swtpm.enable = true;
  # };
  # virtualisation.spiceUSBRedirection.enable = true;
  hardware.nvidia-container-toolkit.enable = true;
}
