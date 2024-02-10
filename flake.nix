{
  description = "Thomas's system";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    nix-software-center.url = "github:vlinkz/nix-software-center"; 
   };

home-manager = {
     url = "github:nix-community/home-manager";
     inputs.nixpkgs.follows = "nixpkgs";
    };
  };
outputs = { self, nixpkgs,  ...}@inputs:
  
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
       specialArgs = { inherit inputs hyprland; };
       modules = [
        /etc/nixos/configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  };

  nixConfig = {
    extra-substituters = ["https://hyprland.cachix.org"];
    extra-trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
}

