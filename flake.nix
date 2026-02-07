{
  description = "Statically compiled e2fsprogs with musl";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        
      in
      {
        packages = {
          default = pkgs.pkgsStatic.e2fsprogs;
          e2fsprogs-static = pkgs.pkgsStatic.e2fsprogs;
        };
      }
    );
}
