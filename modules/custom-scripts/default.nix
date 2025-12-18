{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  name = "custom-scripts";
  src = ./src;
  phases = [ "installPhase" ];
  installPhase = ''
    mkdir -p $out/bin
    cp -r $src/* $out/bin
    chmod -R +x $out/bin/*
  '';
}
