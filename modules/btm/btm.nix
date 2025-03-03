{ ... }:
{
  programs.bottom = {
    enable = true;
    settings = {
      flags = {
        enable_gpu = true;
      };

      styles = {
        theme = "gruvbox";
      };
    };
  };
}
