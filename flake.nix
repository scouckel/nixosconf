{
  description = "Nixos config flake";

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
  };

  outputs = { self, nixpkgs, home-manager, nix-flatpak, nur, ... }@inputs:
  
  let

    inherit (self) outputs;

  in { 
  
    # module import
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    nixosConfigurations = {
    # desktop
      vecna = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./hosts/vecna/configuration.nix
          nix-flatpak.nixosModules.nix-flatpak
          home-manager.nixosModules.home-manager { 
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jck = import ./hosts/vecna/home.nix;
            home-manager.extraSpecialArgs = {inherit inputs;};
          }
          nur.modules.nixos.default
        ];
      };
    };
    
  };

}
