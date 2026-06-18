{
  config,
  ...
}:
let
  ph = config.sops.placeholder;
in
{
  sops = {
    defaultSopsFile = ../../secrets/thorfinn.yaml;
    age = {
      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };

    secrets."foo" = { };
    secrets."bar/baz" = { };

    templates."zap.conf" = {
      content = ''
        [a test config]
        foo = ${ph."foo"}
        zap = ${ph."bar/baz"}
      '';
    };
  };
}
