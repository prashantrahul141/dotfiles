_: {

  # global config
  global = {
    udev-embedded-probe-rs = builtins.readFile ./assets/69-probe-rs.rules;
  };

  # per system level config
  # conf.host.${hostname}.property
  host = {
    thorfinn = {
      users = {
        mori = {
          username = "mori";
        };
      };

      fastfetch = {
        image = ./assets/thorfinn.jpeg;
      };

      zsh = {
        fcp-enabled = true;
      };
    };

    kaworu = {
      users = {
        prashant = {
          username = "prashant";
        };
      };

      zsh = {
        fcp-enabled = true;
      };
    };

    kuujo = {
      domain = {
        name = "prashantrahul";
        tld = "com";
      };
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
  # username = config.home.username
  user = {
    termux = {
      sshPublicKey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDCGZ7XlknzIIsD/Hgobej0ef8o1BjHMwHgZ8utucSYhTS02IMA0jjkRMrrOOwneN2EBYMP7YL74u/tGIoe+8xVKGU/vDgBWiv2akF4FHep8VIJPvHKD5cpRgcFzRHoMOwm292YK7KgfJ0Ve8Ao3qddsNU3B/mwmDW3twdLiUzSLvymxFKx2tsmyIHDw8pwE7JsFNWuNkXv3UqpGrIjMGal9hCoWBSXkaiOO35E/aPU3cuLSPHjK2CPXALK1f43DkIJqvWb+H4rs4PEB2aAtBhmBmsYBp0BN5CnjmXQ9tjLHNm1GXE9oG8NcYWCcRgivA8u5+NLlTWFGE66s9J6gqtSYzI/IKIWYICLqp1FW2w+cE0AezrzujjLK8oC1xwlpS21rB8EkKM/C+CnsmzWdCPe5KaY2L/SSTdL2+9J8gYyVUOar4hs3mCipf/sgypxgAo0mIQq25HR/lBcFyRUtPSPdzopn4lwOunYMCQ5hENe60s3qPKp4yJpmdoqJlHztWp51QlDXOOJ2ILnz8SNNAAm/ZarS/Guq5OIkll8x4GGg9retfe6NLQcIrvKF6gGjEECOYtB+jdDZBkv5tkAUCE3YF8PG4Gbu0Ff3zIBVIZTmRPjbRjCwrWATnRJFc9WIPkcOiILr3ZRSbv7bj2d41/BN3b3jLhNwBgeLTl82vMyGQ== prashant@termux.com";
    };
    prashant = {
      sshPublicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILywmF3cQGvxFYf/15WuZK0nY/3tmRa8O7MEM6BZJDOR prashant@root";

      # git
      git = {
        user = {
          name = "Prashant Rahul";
          email = "me@prashantrahul.com";
          signingkey = "6C3E91A8D7F0386D"; # gpg --list-secret-keys --keyid-format=long
        };
      };
    };

    mori = {
    };

    biskit = {
    };
  };

}
