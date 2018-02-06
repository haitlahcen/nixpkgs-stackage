# Generated by stackage2nix 0.6.1 from "/nix/store/jwic59nw202khsy06b5hy9irq3zipzb8-stackage-lts/lts-2.5.yaml"
{ pkgs, haskellLib }:

with haskellLib; self: super: {

  # core packages
  "Cabal" = null;
  "array" = null;
  "base" = null;
  "bin-package-db" = null;
  "binary" = null;
  "bytestring" = null;
  "containers" = null;
  "deepseq" = null;
  "directory" = null;
  "filepath" = null;
  "ghc-prim" = null;
  "haskeline" = null;
  "haskell2010" = null;
  "haskell98" = null;
  "hoopl" = null;
  "hpc" = null;
  "integer-gmp" = null;
  "old-locale" = null;
  "old-time" = null;
  "pretty" = null;
  "process" = null;
  "rts" = null;
  "template-haskell" = null;
  "terminfo" = null;
  "time" = null;
  "transformers" = null;
  "unix" = null;
  "xhtml" = null;
  # break cycle: text QuickCheck test-framework xml quickcheck-unicode test-framework-hunit test-framework-quickcheck2
  "QuickCheck" = dontCheck super.QuickCheck;
  "text" = dontCheck super.text;
  # break cycle: hspec-meta hspec-expectations hspec hspec-core silently nanospec hspec-discover stringbuilder markdown-unlit
  "markdown-unlit" = dontCheck super.markdown-unlit;
  "stringbuilder" = dontCheck super.stringbuilder;
  "hspec-discover" = dontCheck super.hspec-discover;
  "nanospec" = dontCheck super.nanospec;
  "hspec-expectations" = dontCheck super.hspec-expectations;
  # break cycle: statistics monad-par mwc-random vector-algorithms
  "mwc-random" = dontCheck super.mwc-random;

}
