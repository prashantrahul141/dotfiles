{ conf, ... }: {

  users = {
    users.biskit = {
      isNormalUser = true;
      description = "biskit";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      openssh.authorizedKeys.keys = [
        conf.user.prashant.sshPublicKey
        conf.user.termux.sshPublicKey
      ];
    };
  };
}
