{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    purescript-overlay.url = "github:thomashoneyman/purescript-overlay";
  };
  outputs = { self, nixpkgs, purescript-overlay }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ purescript-overlay.overlays.default ];
      };
    in {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          nodejs

          purescript
          spago-unstable
          nixfmt
        ];
      };
    };
}
