{ stdenv, cacert, git, curl
, cacheVersion ? "0" }:

{

  hackage-db = stdenv.mkDerivation {
    name = "hackage-db";
    version = cacheVersion;
    phases = [ "installPhase" ];
    src = builtins.fetchGit {
      url = "https://github.com/haitlahcen/hackage-db.git";
      ref = "master";
      rev = "b0ac419c8497f5caee46c9c5320c98f807467ea6";
    };
    installPhase = ''
      mkdir -p $out
      pushd $out
      cp $src/01-index.tar.gz 01-index.tar.gz
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
      rev = "bc9fc7c635cbb158a5e598ae080e06e250440e7c";
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
