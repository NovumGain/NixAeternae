{
  inputs = {
    home-manager.url = github:nix-community/home-manager;
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager }@inputs: {
    nixosConfigurations = {
      "host-pc" = nixpkgs.lib.nixosSystem {
        modules = [ ./configuration.nix ];
        system = "x86_64-linux";
        specialArgs = inputs;
      };
    };
  };
}
