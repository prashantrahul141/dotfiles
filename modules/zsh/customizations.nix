{ stdenv, lib }:

stdenv.mkDerivation {
  name = "history-search-multi-word";
  src = lib.cleanSource ./history-search-multi-word;
  dontBuild = true;

  installPhase = ''
    mkdir -p $out/plugins/history-search-multi-word
    cp -r ./* $out/plugins/history-search-multi-word/
  '';
}
