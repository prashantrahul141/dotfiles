{ conf, ... }: {

  users = {
    users.biskit = {
      isNormalUser = true;
      description = "biskit";
      extraGroups = [
        "networkmanager"
      ];
      openssh.authorizedKeys.keys = [
        conf.user.prashant.sshPublicKey
      ];

    };
  };

}
