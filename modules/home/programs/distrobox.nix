{
  programs.distrobox = {
    enable = true;
    containers = {
      archlinux = {
        image = "archlinux:latest";
        additional_packages = "bc base-devel openssl libelf elfutils lz4 git python curl dwarves cpio";
        entry = true;
        pull = true;
      };
    };
  };
}
