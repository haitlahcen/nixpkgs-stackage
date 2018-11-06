{ stdenv, cacert, git, curl
, cacheVersion ? "0" }:

{

  hackage-db = stdenv.mkDerivation {
    name = "hackage-db";
    version = cacheVersion;
    phases = [ "installPhase" ];
    src = builtins.fetchurl {
      url = "https://hackage.haskell.org/01-index.tar.gz";
      sha256 = "0hczs7fldxliw413ky926f4gp0c5dsxrxpy9kmm9v2fdh0gs9y81";
    };
    installPhase = ''
      mkdir -p $out
      pushd $out
      cp $src 01-index.tar.gz
      gunzip --keep 01-index.tar.gz
      popd
    '';
    SSL_CERT_FILE="${cacert}/etc/ssl/certs/ca-bundle.crt";
  };

  all-cabal-hashes = stdenv.mkDerivation rec {
    name = "all-cabal-hashes";
    version = cacheVersion;
    phases = [ "installPhase" ];
    src = builtins.fetchGit {
      url = "https://github.com/commercialhaskell/all-cabal-hashes.git";
      ref = "hackage";
      rev = "abed6aa79c87ba374580615dd776863531d301ab";
    };
    installPhase = ''
      mkdir -p $out
      cp -r $src $out
    '';
    SSL_CERT_FILE="${cacert}/etc/ssl/certs/ca-bundle.crt";
  };

  stackage-lts = stdenv.mkDerivation {
    name = "stackage-lts";
    version = cacheVersion;
    phases = [ "installPhase" ];
    src = builtins.fetchGit {
      url = "https://github.com/fpco/lts-haskell.git";
      ref = "master";
      rev = "3edcfa5096acd1ef88e35bc00d54164f154237a1";
    };
    installPhase = ''
      mkdir -p $out
      cp -r $src $out
    '';
    SSL_CERT_FILE="${cacert}/etc/ssl/certs/ca-bundle.crt";
  };

}
