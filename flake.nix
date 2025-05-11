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
    # aagl (An anime game launchers)
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # spicetify for nix (custom spotify)
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Ags (Status Bar)
    ags.url = "github:Aylur/ags";
    # Catppuccin for NIX
    catppuccin.url = "github:catppuccin/nix";
    # Hyprland
    hyprland.url = "git+https://github.com/hyprwm/Hyprland";
    # Stylix (Styling Environment For NixOS)
    stylix.url = "github:danth/stylix";
    # anyrun
    anyrun.url = "github:anyrun-org/anyrun";
    # Zen Browser Flake
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Yet Another Neovim Framework for Nix
    nvf.url = "github:notashelf/nvf";
  };

  outputs =
    {
      self,
      nixpkgs,
      aagl,
      home-manager,
      nvf,
      stylix,
      hyprland,
      catppuccin,
      spicetify-nix,
      zen-browser,
      ...
    }@inputs:
    let
      inherit (self) outputs;
    in
    {
      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        # FIXME replace with your hostname
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          # > Our main nixos configuration file <
          modules = [
            ./nixos/configuration.nix
            catppuccin.nixosModules.catppuccin
            stylix.nixosModules.stylix
            {
              imports = [ aagl.nixosModules.default ];
              nix.settings = aagl.nixConfig;
              aagl.enableNixpkgsReleaseBranchCheck = false;
              programs.honkers-railway-launcher.enable = true;
            }
          ];
        };
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      homeConfigurations = {
        # FIXME replace with your username@hostname
        "xenom@nixos" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs; };
          # > Our main home-manager configuration file <
          modules = [
            ./home-manager/home.nix
            nvf.homeManagerModules.default
            catppuccin.homeModules.catppuccin
            stylix.homeManagerModules.stylix
            hyprland.homeManagerModules.default
            spicetify-nix.homeManagerModules.default
            {
              home.packages = [
                zen-browser.packages."x86_64-linux".default
              ];
            }
          ];
        };
      };
    };
}
