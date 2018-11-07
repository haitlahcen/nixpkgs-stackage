{ pkgs, haskellLib }:

with haskellLib; self: super: {
  cabal2nix = pkgs.haskellPackages.cabal2nix;
  hlibgit2 = pkgs.haskellPackages.hlibgit2;
}
