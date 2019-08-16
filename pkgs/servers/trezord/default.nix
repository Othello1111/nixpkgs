{ stdenv, buildGoPackage, fetchFromGitHub }:

buildGoPackage rec {
  name = "trezord-go-${version}";
  version = "unstable-20190816";

  # Fixes Cgo related build failures (see https://github.com/NixOS/nixpkgs/issues/25959 )
  hardeningDisable = [ "fortify" ];

  goPackagePath = "github.com/trezor/trezord-go";

  src = fetchFromGitHub {
    owner  = "trezor";
    repo   = "trezord-go";
    rev    = "1ff6715175ef4add89052cd6d7d181b1a5d7af5a";
    sha256 = "12rh54q0nhxnvsjdyrm00ckfvq6dgjhnvkg9vigdci8497adzpqm";
  };

  meta = with stdenv.lib; {
    description = "TREZOR Communication Daemon aka TREZOR Bridge";
    homepage = "https://trezor.io";
    license = licenses.lgpl3;
    maintainers = with maintainers; [ canndrew jb55 "1000101" prusnak mmahut ];
    platforms = platforms.unix;
  };
}
