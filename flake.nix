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
        
        libblkid-static = pkgs.runCommand "libblkid-static" {} ''
          mkdir -p $out

          if [ -d "${pkgs.pkgsStatic.util-linux.lib}/lib" ]; then
            cp -rL ${pkgs.pkgsStatic.util-linux.lib}/lib $out/
          fi

          if [ -d "${pkgs.pkgsStatic.util-linux.dev}/include" ]; then
            cp -rL ${pkgs.pkgsStatic.util-linux.dev}/include $out/
          fi
        '';
      in
      {
        packages = {
          default = pkgs.pkgsStatic.e2fsprogs;
          e2fsprogs-static = pkgs.pkgsStatic.e2fsprogs;
          libblkid-static = libblkid-static;
        };
      }
    );
}
