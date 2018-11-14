{ stdenv, cacert, git, curl }:

{
  hackage-db = stdenv.mkDerivation {
    name = "hackage-db";
    phases = [ "installPhase" ];
    src = builtins.fetchGit {
      url = "https://github.com/haitlahcen/hackage-db.git";
      ref = "master";
      rev = "9eefeff748e95766619018ab21ddf373e36f0430";
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
    phases = [ "installPhase" ];
    src = builtins.fetchGit {
      url = "https://github.com/commercialhaskell/all-cabal-hashes.git";
      ref = "hackage";
      rev = "275a4a2543c7e022643b907d85ebba132103871f";
    };
    installPhase = ''
      mkdir -p $out
      cp -r $src $out
    '';
    SSL_CERT_FILE="${cacert}/etc/ssl/certs/ca-bundle.crt";
  };

  stackage-lts = stdenv.mkDerivation {
    name = "stackage-lts";
    phases = [ "installPhase" ];
    src = builtins.fetchGit {
      url = "https://github.com/fpco/lts-haskell.git";
      ref = "master";
      rev = "f9863585aebc08a2458991e3939619b0b044aed0";
    };
    installPhase = ''
      mkdir -p $out
      cp -r $src $out
    '';
    SSL_CERT_FILE="${cacert}/etc/ssl/certs/ca-bundle.crt";
  };
}
