{ ... }: {
  boot = {

    supportedFilesystems = [ "ntfs" ];

    loader = {

      efi.efiSysMountPoint = "/boot";

      grub = {
        enable = true;
        devices = [ "nodev" ];
        efiInstallAsRemovable = true;
        efiSupport = true;
        useOSProber = true;
      };

    };

    plymouth = { enable = true; };

  };
}
