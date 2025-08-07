# in flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        overlays = [ ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };

        yoga = pkgs.callPackage ./yoga.nix { };
      in
      {
        packages.yoga = yoga;
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            luajit
            luajitPackages.luarocks
            pkg-config
            yoga
          ];
        };
      }
    );
}
