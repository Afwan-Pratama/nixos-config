{ ... }: {

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;

  security.apparmor.enable = true;

  security.sudo.enable = false;
  security.doas = {
    enable = true;
    extraRules = [{
      users = [ "xenom" ];
      keepEnv = true;
      persist = true;
    }];
  };

}
