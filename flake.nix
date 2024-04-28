{
  description = "My nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Ags (Status Bar)
    ags.url = "github:Aylur/ags";
    # Custom CSS firefox "cascade"
    cascade-simple = {
      url = "github:Afwan-Pratama/cascade-simple";
      flake = false;
    };
    # Add-Ons Firefox 
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland";
    # nix-locate
    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Nixvim (Neovim Distro For NixOS)
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Stylix (Styling Environment For NixOS)
    stylix.url = "github:danth/stylix";
    # Walker (Application Runner)
    walker.url = "github:abenz1267/walker";

  };

  outputs = { self, nixpkgs, home-manager, nix-index-database, nixvim, stylix
    , hyprland, ... }@inputs:
    let inherit (self) outputs;
    in {
      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        # FIXME replace with your hostname
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          # > Our main nixos configuration file <
          modules = [ ./nixos/configuration.nix ];
        };
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      homeConfigurations = {
        # FIXME replace with your username@hostname
        "xenom@nixos" = home-manager.lib.homeManagerConfiguration {
          pkgs =
            nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs; };
          # > Our main home-manager configuration file <
          modules = [
            ./home-manager/home.nix
            nixvim.homeManagerModules.nixvim
            nix-index-database.hmModules.nix-index
            stylix.homeManagerModules.stylix
            hyprland.homeManagerModules.default
            { wayland.windowManager.hyprland.enable = true; }
          ];
        };
      };
    };
}
