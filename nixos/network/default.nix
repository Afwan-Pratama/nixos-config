{ ... }: {

  # TODO: Set your hostname
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall.enable = true;
    proxy = { noProxy = "127.0.0.1,localhost,internal.domain"; };
  };

}
