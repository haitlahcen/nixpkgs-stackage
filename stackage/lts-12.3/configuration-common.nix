{ pkgs, haskellLib }:

with haskellLib; self: super: {
  cabal2nix = dontCheck super.cabal2nix;
  streaming-commons = dontCheck super.streaming-commons;
  hlibgit2 = pkgs.haskellPackages.hlibgit2;
  mkDerivation = args: super.mkDerivation (args // {
    enableLibraryProfiling = false;
    enableExecutableProfiling = false;
    doHaddock = false;
  });
}
