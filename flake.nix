# root configuration
# darwin-rebuild switch --flake ~/.config/darwin
{
  description = "Darwin configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, darwin, ... }:
    let
      user = {
        name = builtins.getEnv "DARWIN_USER";
        host = builtins.getEnv "DARWIN_HOST";
      };
    in {
      darwinConfigurations.${user.host} = darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        modules = [
          ./configuration.nix
          home-manager.darwinModules.home-manager
          {
            system.stateVersion = 5;
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${user.name} = import ./home.nix;
            users.users.${user.name}.home = "/Users/${user.name}";
          }
        ];
      };
    };
}
