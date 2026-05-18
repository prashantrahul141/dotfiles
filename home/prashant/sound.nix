_: {
  # mpd
  services.mpd = {
    enable = true;
    musicDirectory = "~/Music/";
    network = {
      listenAddress = "10.10.0.2";
      port = 6600;
      startWhenNeeded = true;
    };
    extraConfig = ''
      audio_output {
        type            "pipewire"
        name            "mpd-local"
      }

      audio_output {
        type                  "httpd"
        name                  "mpd-over-stream"
        encoder               "vorbis"
        port                  "6601"
        bind_to_address       "10.10.0.2"
        mixer_type            "null"
        quality               "5.0"
        format                "44100:16:1"
        max_clients           "4"			# optional 0=no limit
      }
    '';
  };

}
