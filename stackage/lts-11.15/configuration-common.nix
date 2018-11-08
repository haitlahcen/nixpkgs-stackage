{ pkgs, haskellLib }:

with haskellLib; self: super: {
  mkDerivation = args: super.mkDerivation (args // {
    enableLibraryProfiling = false;
    enableExecutableProfiling = false;
    doHaddock = false;
  });
}
