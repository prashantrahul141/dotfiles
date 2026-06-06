{ ... }:
{
  programs.halloy = {
    enable = true;
    settings = {
      servers = {
        oftc = {
          server = "irc.oftc.net";
          use_tls = true;
          port = 6697;
          nickname = "prashant141";
          channels = [ "#kernelnewbies" ];
        };
        Libera = {
          server = "irc.libera.chat";
          use_tls = true;
          port = 6697;
          nickname = "prashant141";
        };
      };
    };
  };
}
