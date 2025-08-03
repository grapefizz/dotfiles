{
  description = "Ari's macOS dotfiles with Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin.url = "github:LnL7/nix-darwin";
  };

  outputs = { nixpkgs, home-manager, darwin, ... }:
    let
      system = "aarch64-darwin"; # change to x86_64-darwin if Intel Mac
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # Home Manager configuration (existing)
      homeConfigurations = {
        "Ari" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
        };
      };

      # nix-darwin configuration (minimal first)
      darwinConfigurations = {
        "Ari-MacBook" = darwin.lib.darwinSystem {
          inherit system;
          modules = [
            ./darwin.nix
          ];
        };
      };
    };
}

