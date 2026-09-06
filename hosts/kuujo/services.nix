{ conf, ... }: {
  services.dumahhfiles = {
    enable = true;

    internalHost = "127.0.0.1";
    internalPort = 3000;

    externalProtocol = "https";
    externalHost = "f.${conf.host.kuujo.domain.name}.${conf.host.kuujo.domain.tld}";

    password = null;
    cookiesFilepath = null;
  };

}
