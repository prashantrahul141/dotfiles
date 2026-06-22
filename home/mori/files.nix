_: {

  # plain files is through 'home.file'.
  home.file = {
    ".config/flameshot/flameshot.ini".text = ''
      [General]
      drawColor=#ff0000
      disabledGrimWarning=true
    '';

    ".config/clangd/config.yml".text = ''
      If:
        PathMatch: .*\.h
      CompileFlags:
        Add: [-xc-header]

      ---
      If:
        PathMatch: .*\.c
      CompileFlags:
        Add: [-xc]
    '';

    ".npmrc".text = ''
            audit=false
            fund=false
      progress=false'';

  };

}
