{ pkgs, ... }:
{
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
  # virtualisation.libvirtd = {
  #   enable = true;
  #   # allowedBridges = [ ];
  #   qemu = {
  #     package = pkgs.qemu_kvm;
  #     runAsRoot = true;
  #     swtpm.enable = true;
  #     verbatimConfig = ''
  #       # Adapted from /var/lib/libvirt/qemu.conf
  #       # Note that AAVMF and OVMF are for Aarch64 and x86 respectively
  #       nvram = [ "/run/libvirt/nix-ovmf/AAVMF_CODE.fd:/run/libvirt/nix-ovmf/AAVMF_VARS.fd", "/run/libvirt/nix-ovmf/OVMF_CODE.fd:/run/libvirt/nix-ovmf/OVMF_VARS.fd" ]
  #     '';
  #   };
  # };
  # virtualisation.spiceUSBRedirection.enable = true;
  hardware.nvidia-container-toolkit.enable = true;
}
