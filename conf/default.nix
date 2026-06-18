_: {

  # global config
  global = {
    udev-embedded-probe-rs = builtins.readFile ./assets/69-probe-rs.rules;
  };

  # per system level config
  # conf.host.${hostname}.property
  host = {
    thorfinn = {
      fastfetch = {
        image = ./assets/thorfinn.jpeg;
      };

      zsh = {
        fcp-enabled = true;
      };
    };

    kuujo = {
      zsh = {
        fcp-enabled = false;
      };
      wireguard = {
        public_key = "616xhKtfjCM4P2VQPjCNHvQZSyujWKWlCW5CDVm9Iw8=";
        public_ip = "NOT-SET";
      };
    };
  };

  # per user level config
  # conf.user.${username}.property
  user = {
    prashant = {
      sshPublicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILywmF3cQGvxFYf/15WuZK0nY/3tmRa8O7MEM6BZJDOR prashant@root";

      # git
      git = {
        user = {
          name = "Prashant Rahul";
          email = "prashantrahul141@protonmail.com";
          signingkey = "6C3E91A8D7F0386D"; # gpg --list-secret-keys --keyid-format=long
        };
      };
    };

    biskit = {
    };
  };

}
