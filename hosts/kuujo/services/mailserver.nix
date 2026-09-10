{
  lib,
  conf,
  config,
  ...
}:
let
  domain = "${conf.host.kuujo.domain.name}.${conf.host.kuujo.domain.tld}";
  caddyCertDir = "/var/lib/caddy/.local/share/caddy/certificates/acme-v02.api.letsencrypt.org-directory/mail.${domain}";
in
{
  services.caddy.virtualHosts = {
    "mail.${domain}".extraConfig = ''
      respond "OK" 200
    '';
  };

  users.groups.mailtls = { };
  users.users.postfix.extraGroups = [ "mailtls" ];
  users.users.dovecot2.extraGroups = [ "mailtls" ];

  mailserver = {
    enable = true;
    stateVersion = 5;
    fqdn = "mail.${domain}";
    domains = [ domain ];

    # disabling this because brevo does this
    dkim = {
      enable = false;
    };

    # from caddy
    x509.certificateFile = "/var/lib/mailserver-tls/fullchain.pem";
    x509.privateKeyFile = "/var/lib/mailserver-tls/key.pem";

    # inboxes?
    mailboxes = {
      Trash = {
        auto = "subscribe";
        special_use = "\\Trash";
      };
      Junk = {
        auto = "subscribe";
        special_use = "\\Junk";
      };
      Drafts = {
        auto = "subscribe";
        special_use = "\\Drafts";
      };
      Sent = {
        auto = "subscribe";
        special_use = "\\Sent";
      };
    };

    # nix-shell -p mkpasswd --run 'mkpasswd -s'
    accounts = {
      "me@${domain}" = {
        hashedPasswordFile = config.sops.secrets."mailserver/user_password/me".path;

        # additional addresses delivered to this mailbox
        aliases = [
          "postmaster@${domain}"
        ];
      };
    };
  };

  services.postfix.settings.main = {
    relayhost = [ "[smtp-relay.brevo.com]:587" ];
    smtp_sasl_auth_enable = true;
    smtp_sasl_password_maps = "texthash:${config.sops.templates."postfix-sasl".path}";
    smtp_tls_security_level = lib.mkForce "encrypt";
  };

  # copy caddy's certs once at boot
  systemd.services.mailserver-certs = {
    description = "copy caddy tls for mailserver";
    wantedBy = [ "multi-user.target" ];
    after = [ "caddy.service" ];
    requires = [ "caddy.service" ];
    serviceConfig.Type = "oneshot";
    script = ''
      install -d -m 0750 -o root -g mailtls /var/lib/mailserver-tls
      install -m 0640 -o root -g mailtls \
        ${caddyCertDir}/mail.${domain}.crt /var/lib/mailserver-tls/fullchain.pem
      install -m 0640 -o root -g mailtls \
        ${caddyCertDir}/mail.${domain}.key /var/lib/mailserver-tls/key.pem
    '';
  };

  # recopy when caddy renews the cert
  systemd.paths.mailserver-certs = {
    wantedBy = [ "multi-user.target" ];
    pathConfig.PathChanged = [ caddyCertDir ];
  };

  # restart mail services when the copied cert changes
  systemd.services.mailserver-certs-reload = {
    description = "restart mailserver after certificate renewal";
    serviceConfig.Type = "oneshot";
    script = ''
      systemctl restart postfix.service dovecot.service
    '';
  };
  systemd.paths.mailserver-certs-reload = {
    wantedBy = [ "multi-user.target" ];
    pathConfig.PathChanged = [ "/var/lib/mailserver-tls/fullchain.pem" ];
  };

  # start postfix only after certs are copied
  systemd.services.postfix = {
    requires = [ "mailserver-certs.service" ];
    after = [ "mailserver-certs.service" ];
  };
  systemd.services.dovecot = {
    requires = [ "mailserver-certs.service" ];
    after = [ "mailserver-certs.service" ];
  };
}
