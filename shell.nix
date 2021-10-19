{ sources ? import nix/sources.nix {} }:

let nixpkgs = import sources.nixpkgs {};
in
nixpkgs.mkShell {
  packages = with nixpkgs; [gnumake fennel fnlfmt];
}
