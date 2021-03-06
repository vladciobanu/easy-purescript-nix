{ pkgs ? import <nixpkgs> {} }:

let
  version = "v0.14.0-rc3";

  src = if pkgs.stdenv.isDarwin
  then pkgs.fetchurl {
    url = "https://github.com/purescript/purescript/releases/download/v0.14.0-rc3/macos.tar.gz";
    sha256 = "02x78s7pwhy8mk0biz1gv513m17126avg7jfwsiyja4acjwwvm2b";
  }
  else pkgs.fetchurl {
    url = "https://github.com/purescript/purescript/releases/download/v0.14.0-rc3/linux64.tar.gz";
    sha256 = "0lcqajidxk3rjq5qs1d01jvbhz73l7w7iv16mpl1hp7ayb7fhpd8";
  };

in
import ./mkPursDerivation.nix {
  inherit pkgs version src;
}
