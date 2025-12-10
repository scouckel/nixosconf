{
  description = "scouckel config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify.url = "github:Gerg-L/spicetify-nix";
    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nvf = {
      url = "github:NotAShelf/nvf/v0.8";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nordvpn-flake.url = "github:scouckel/nordvpn-flake";
  };

  outputs = { nixpkgs, home-manager, nix-flatpak, nur, auto-cpufreq, nixos-hardware, nordvpn-flake, ... }@inputs: {
    nixosConfigurations = {
    # desktop
      vecna = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/vecna/configuration.nix
          ./modules/nixos
          nix-flatpak.nixosModules.nix-flatpak
          home-manager.nixosModules.home-manager { 
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jck = {
              imports = [
                ./hosts/vecna/home.nix
                ./modules/home-manager
                inputs.nvf.homeManagerModules.default
              ];
            };
            home-manager.extraSpecialArgs = {inherit inputs;};
          }
          nur.modules.nixos.default
          nordvpn-flake.nixosModules.nordvpn-flake
        ];
      };
      # laptop
      xanathar = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/xanathar/configuration.nix
          ./modules/nixos
          nix-flatpak.nixosModules.nix-flatpak
          home-manager.nixosModules.home-manager { 
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jck = {
              imports = [
                ./hosts/xanathar/home.nix
                ./modules/home-manager
                inputs.nvf.homeManagerModules.default
              ];
            };
            home-manager.extraSpecialArgs = {inherit inputs;};
          }
          nur.modules.nixos.default
          auto-cpufreq.nixosModules.default
        ];
      };
      # new laptop
      tiamat = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/tiamat/configuration.nix
          ./modules/nixos
          nix-flatpak.nixosModules.nix-flatpak
          home-manager.nixosModules.home-manager { 
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jck = {
              imports = [
                ./hosts/tiamat/home.nix
                ./modules/home-manager
                inputs.nvf.homeManagerModules.default
              ];
            };
            home-manager.extraSpecialArgs = {inherit inputs;};
          }
          nur.modules.nixos.default
          auto-cpufreq.nixosModules.default
          nixos-hardware.nixosModules.framework-13-7040-amd
        ];
      };
      generic = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/generic/configuration.nix
          /etc/nixos/hardware-configuration.nix
          ./modules/nixos
          nix-flatpak.nixosModules.nix-flatpak
          home-manager.nixosModules.home-manager { 
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jck = {
              imports = [
                ./hosts/generic/home.nix
                ./modules/home-manager
                inputs.nvf.homeManagerModules.default
              ];
            };
            home-manager.extraSpecialArgs = {inherit inputs;};
          }
          nur.modules.nixos.default
        ];
      };
    };
  };
}
