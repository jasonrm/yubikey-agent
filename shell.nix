{ pkgs ? import <nixpkgs> {} }:
let
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
in
{
  devEnv = pkgs.stdenv.mkDerivation {
    name = "dev";
    buildInputs = with pkgs; [
      stdenv
      go
      pkg-config
    ] ++ (if isDarwin then [
          darwin.apple_sdk.frameworks.PCSC
    ] else []);
  };
}
