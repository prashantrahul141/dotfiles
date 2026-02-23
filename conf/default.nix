{ ... }:
{

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
    };

    kuujo = { };
  };

  # per user level config
  # conf.user.${username}.property
  user = {
    prashant = {
      sshPublicKey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCwkCTahtAlO6AAoHa4J1HgsKNVydpkzY6ybOyZ3wNc/lHTPw92CHjcBaMN2OX//tMtEBWDOf/4GTusd5Rvt4i4hStdqzbAiKPqguCsMTpCMEJ6BSNycqMsK1JZ2EcDzXOc6Ys/l9lrK8NehqB8E+KWCr/ZSAu06zQyU1jaJZ9QQNbhitEtCmS9hHL3K5quNfIqux2V8t2hU1kicXwgInb8gLwtVuV/MsZPJgrE9VxiowthMVpXiaqbSD6xpdIWz/W+cis2HgY7j6kniuEf9M+JCFlaQcu8lBk5Hkd85DIMDNLBXtLQ8ufgGkuKrlucOl1ADq6S9F2+FbiJskLWhkwScYDyYNZ4NvCE9x3oLPscP4klyYCG1XunhHeq/60C5oueZCE8lfKBVtUVI6uY79zDhXhBZQmiylNr3JgEtW1DMAGHWtSttSIFKER8yBaDyM5kwGm1yAeh+EK5R4wDZfyUZVNKUNtF3uzWAy9S/yNlM3thimKarCDWe4+1e1G1chU= prashant@root";

      # git
      git = {
        user = {
          name = "Prashant Rahul";
          email = "prashantrahul141@protonmail.com";
          signingkey = "6C3E91A8D7F0386D";
        };
      };
    };

    biskit = {
    };
  };

}
