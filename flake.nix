{
  description = "Ari's macOS dotfiles with Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin.url = "github:LnL7/nix-darwin";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs = { nixpkgs, home-manager, darwin, nix-homebrew, ... }:
    let
      system = "aarch64-darwin"; # change to x86_64-darwin if Intel Mac (have not tested)
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # Home Manager configuration
      homeConfigurations = {
        "Ari" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
        };
      };

      # nix-darwin and nix-homebrew configuration
      darwinConfigurations = {
        "Ari-MacBook" = darwin.lib.darwinSystem {
          inherit system;
          modules = [
            nix-homebrew.darwinModules.nix-homebrew
            ./darwin.nix
            ./homebrew.nix
          ];
        };
      };
    };
}

